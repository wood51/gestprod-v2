<?php
// TODO recup les erreur engagement et faire les possible et signaler les impossible"
class EngagementService
{
    
    public function engagerMultiple($data) {
        //echo var_dump($data);die();
        $semaine = str_replace('W','',$data->semaine);
        if(!empty($data)) {
            foreach ($data->select as $produit) {
                $engagementData = (object) [
                    'semaine_engagee' => $semaine,
                    'produit' =>intval($produit)
                ];
                try {
                    $this->engager($engagementData);
                } catch (\Exception $e){
                    throw new Exception($e->getMessage(),$e->getCode());
                }
            }
        }
    }

    public function engager($data)
    {

        $planningId = $data->produit;
        $semaine = str_replace('W','',$data->semaine_engagee);


        $last = ProdEngagementModel::getLastEngagement($planningId);
        $status = isset($last) ? $last->status : null;

        if (in_array($status, ['fait', 'annulé'])) {
            throw new Exception("Engagement interdit (statut bloqué : $status).",400);
        }

        // Aucun engagement ou reporté -> créer une nouvelle ligne
        if (is_null($status) || $status === 'reporté') {
            $now = (new DateTimeImmutable())->format('Y-W');
            $engagement = new ProdEngagementModel(); // TODO Passer en statique
            $engagement->fk_planning = $planningId;
            $engagement->status = ($semaine === $now) ? 'engagé' : 'prévisionnel';
            $engagement->semaine_engagee = $semaine;
            $engagement->insert();
            return true;
        }

        // Si c'était prévisionnel -> on le confirme
        if ($status === 'prévisionnel') {
            $last->status = 'engagé';
            $last->semaine_engagee = $semaine;
            $last->update();
            return true;
        }

        throw new Exception("Aucune transition valide pour engagement depuis $status.",400);
    }

    public  function reporter($data) // TODO Passer en logique $data
    {

        $planningId = $data->produit;
        $commentaire = $data->commentaire;
        
        
        $last = ProdEngagementModel::getLastEngagement($planningId);
        if ($last && $last->status !== 'engagé') {
            throw new Exception("Seul un produit 'engagé' peut être reporté.",400);
        }
        
        if($commentaire) {
            $last->commentaire = $commentaire;
        }

        $last->status = 'reporté';
        $last->save();
        // echo var_dump($last->insert());die();

        return true;
    }

    public function marquerFait(int $planningId, $numero): bool|string
    {
        $last = ProdEngagementModel::getLastEngagement($planningId);

        if (!$last || !in_array($last->status, ['engagé', 'en cours'])) {
            throw new Exception("Seul un engagement 'engagé' ou 'en cours' peut être marqué comme fait.");
        }

        if (ProdPlanningModel::updateNumero($planningId, $numero) && ProdPlanningModel::setPret($planningId)) {
            $last->status = 'fait';
            $last->save();

            return true;
        }
        throw new Exception("Impossible d'update le numero de produit.");
    }

}