<?php

class PlanningController
{

    /**
     * @route("POST /planning/engagement")
     * Met à jour le statut d'engagement d'un produit selon les données POST
     * @param Base $f3 Instance du framework Fat-Free
     */
    public function planning_update_engagement($f3)
    {
        $data = $this->cleanData($f3->POST);

        // Validation des données
        if (empty($data->produit)) {
            // Gestion erreur - produit obligatoire
            $f3->error(400, 'Id Produit obligatoire');
            return;
        }

        try {
            if ($data->pret) {
                EngagementService::marquerFait($data->produit);
            } elseif ($data->report) {
                EngagementService::reporter($data->produit);
            } elseif ($data->semaine) {
                EngagementService::engager($data->produit, $data->semaine);
            }
        } catch (Exception $e) {
            // Gestion erreur - erreur service
            $f3->error(500, 'Failed to update engagement');
        }
    }

    private function cleanData($data)
    {
        $cleaned = [
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
