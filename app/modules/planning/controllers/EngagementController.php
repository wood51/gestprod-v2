<?php
class EngagementController
{
    protected $service;

    public function __construct()
    {
        $this->service = new EngagementService();
    }
    /**
     * @route("POST /planning/engagement")
     * Met à jour le statut d'engagement d'un produit selon les données POST
     * @param Base $f3 Instance du framework Fat-Free
     */
    public function planning_update_engagement($f3)
    {
        $data = $this->service->cleanData($f3->POST);

        // Validation des données
        if (empty($data->produit)) {
            // Gestion erreur - produit obligatoire
            $f3->error(400, 'Id Produit obligatoire');
            return;
        }

        try {
            if ($data->pret) {
                $this->service->marquerFait($data->produit, $data->numero);
            } elseif ($data->report) {
                $this->service->reporter($data->produit);
            } elseif ($data->semaine) {
                $this->service->engager($data->produit, $data->semaine);
            }
        } catch (Exception $e) {
            // Gestion erreur - erreur service
            $f3->error(500, 'Impossible de mettre a jours l\'engagement : '.$e->getMessage());
        }

        $planning = new PlanningService();
        $planning->renderPartialPlanning();
       
    }
}
