<?php
class PresenceModel extends BaseModel
{
    /**
     * Constructeur pour initialiser le modèle PresenceModel avec la table 'presence'.
     */
    public function __construct()
    {
        parent::__construct('presence');
    }

    /**
     * Récupère le nombre d'opérateurs et les heures travaillées pour une semaine donnée.
     *
     * @param int|null $semaine Numéro de la semaine (si null, prend la semaine courante).
     * @param int|null $annee Année (si null, prend l'année courante).
     * @param float $heures_semaine Nombre d'heures travaillées par semaine pour un opérateur (par défaut 35).
     * @return array Tableau associatif contenant les heures normales, les heures supplémentaires et le nombre total d'opérateurs équivalents.
     * @throws Exception En cas d'erreur lors de la récupération des données.
     */
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
}
