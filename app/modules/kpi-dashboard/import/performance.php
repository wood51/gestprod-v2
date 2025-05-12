<?php
class performance
{
    /**
     * @route("GET /performance/@semaine")
     */
    public function performanceActuel($f3, $params)
    {
        try {
            $semaine = $params['semaine'];

            $f3->set('HEADER.Content-Type', 'application/json');
            echo json_encode(["performance" => $this->calculPerformance($semaine)]);
        } catch (\Exception $e) {
            $f3->error(500, "Erreur lors du calcul de la performance actuelle: " . $e->getMessage());
        }
    }


    private function calculPerformance($semaine)
    {


        try {
            $annee_number = explode("-", $semaine)[0];
            $semaine_number = explode("-", $semaine)[1];
            $operateurs = $this->getNbOperateursSemaine($semaine_number, $annee_number); // TODO MODIF PRESENCE POUR SEMAINE UNIQUE ?????????????
            $nb_machines_prete = $this->getNbMachinePretes($semaine);
            $objectif_production = $operateurs['total_operateurs'];
            $indice_performance = ($objectif_production) ? round(($nb_machines_prete / $objectif_production) * 100, 2) : 0;
            return $indice_performance;
        } catch (\Exception $e) {
            throw new \Exception("Erreur lors du calcul de la performance: " . $e->getMessage());
        }
    }

    public function getNbOperateursSemaine($semaine = null, $annee = null, $heures_semaine = 35)
    {
        try {
            // Utiliser la semaine et l'année courantes par défaut si non spécifiées
            $semaine = $semaine ?? date('W');
            $annee = $annee ?? date('Y');

            // Récupération des données pour la semaine et l'année spécifiées
            $results = (object) $this->find([
                "WEEK(date_jour, 3) = ? AND YEAR(date_jour) = ?",
                $semaine,
                $annee
            ]);

            // Initialisation des heures normales et supplémentaires
            $totalHeuresNormales = 0;
            $totalHeuresSupp = 0;

            if ($results) {
                // Parcourir les résultats pour calculer les heures normales et supplémentaires
                foreach ($results as $presence) {
                    if (!$presence->heures_supp) {
                        $totalHeuresNormales += $presence->nb_operateurs * $presence->nb_heures_normales;
                        $totalHeuresSupp += $presence->nb_heures_supp;
                    } else {
                        $totalHeuresSupp += $presence->nb_operateurs * $presence->nb_heures_normales + $presence->nb_heures_supp;
                    }
                }


                // Calcul du nombre total d'opérateurs équivalents sur la semaine
                $totalOperateursEquivalents = ($totalHeuresNormales + $totalHeuresSupp) / $heures_semaine;

                return [
                    "heures_normales" => $totalHeuresNormales,
                    "heures_supp" => $totalHeuresSupp,
                    "total_operateurs" => $totalOperateursEquivalents
                ];
            } else {
                // Aucun résultat trouvé pour la semaine et l'année spécifiées
                return [
                    "heures_normales" => 0,
                    "heures_supp" => 0,
                    "total_operateurs" => 0
                ];
            }
        } catch (Exception $e) {
            // Gérer les exceptions et relancer pour la gestion par l'appelant
            throw new Exception("Erreur lors de la récupération des heures : " . $e->getMessage());
        }
    }

    // Calcul sans coefficient 
    private function getNbMachinePretes($engagement)
    {
        try {
            $this->planning->nb_machines_pretes = "COUNT(id)";
            $this->planning->load(["engagement = ? and prete=1", "$engagement"]);
            return (!$this->planning->dry()) ? $this->planning->nb_machines_pretes : 0;
        } catch (\Exception $e) {
            throw new \Exception("Erreur lors de la récupération des machines prêtes: " . $e->getMessage());
        }
    }
}
