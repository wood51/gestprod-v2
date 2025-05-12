<?php
class PresenceModel extends DB\Cortex
{
    protected
        $db = 'DB',
        $table= 'atelier_presence';

    public static function getNbOperateursSemaine($semaine = null, $annee = null, $heures_semaine = 35) // Fix utliser les jour travaillé pour h semaine
    {
        $mapper = new self();
        try {
            // Utiliser la semaine et l'année courantes par défaut si non spécifiées
            $semaine = $semaine ?? date('W');
            $annee = $annee ?? date('Y');

            // Récupération des données pour la semaine et l'année spécifiées
            $results = (object) $mapper->find([
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
}
