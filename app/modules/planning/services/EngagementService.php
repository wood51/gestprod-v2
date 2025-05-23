<?php

class EngagementService
{
    public function engager(int $planningId, string $semaine): bool|string
    {

        $last = ProdEngagementModel::getLastEngagement($planningId);
        $status = isset($last) ? $last->status : null;

        if (in_array($status, ['fait', 'annulé'])) {
            return "Engagement interdit (statut bloqué : $status).";
        }

        // Aucun engagement ou reporté -> créer une nouvelle ligne
        if (is_null($status) || $status === 'reporté') {
            $now = (new DateTimeImmutable())->format('Y-W');
            $engagement = new ProdEngagementModel();
            $engagement->fk_planning = $planningId;
            $engagement->status = ($semaine === $now) ? 'engagé' : 'prévisionnel';
            $engagement->semaine_engagee = $semaine;
            $engagement->insert();
            return true;
        }

        // Si c'était prévisionnel → on le confirme
        if ($status === 'prévisionnel') {
            $last->status = 'engagé';
            $last->semaine_engagee = $semaine;
            $last->save();
            return true;
        }

        return "Aucune transition valide pour engagement depuis $status.";
    }

    public  function reporter(int $planningId): bool|string
    {
        $last = ProdEngagementModel::getLastEngagement($planningId);

        if (!$last || $last->status !== 'engagé') {
            return "Seul un engagement 'engagé' peut être reporté.";
        }

        $last->status = 'reporté';
        $last->semaine_engagee = null;
        $last->save();

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

    public function cleanData($data)
    {
        $cleaned = [
            'filter-pret' =>false,
            'pret' => false,
            'numero' => null,
            'semaine' => null,
            'report' => false,
            'produit' => null
        ];

        // transformation des data
        foreach ($data as $key => $value) {
            $parts = explode('-', $key);

            if (count($parts) === 2) {
                $field = $parts[0];

                if ($field === 'semaine') {
                    $value = str_replace('W', '', $value);
                }

                if ($value === 'on') {
                    $value = true;
                }

                $cleaned[$field] = $value;
            }
        }

        return (object) $cleaned;
    }
}
