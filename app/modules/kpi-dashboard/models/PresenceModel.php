<?php
class PresenceModel extends DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'atelier_presence';

    
    public static function getNbOperateursSemaine($semaine = null, $annee = null)
    {
        $mapper = new self();
        $semaine = $semaine ?? date('W');
        $annee = $annee ?? date('Y');

        // Déterminer les dates de début et fin de la semaine
        $start = new DateTimeImmutable();
        $start = $start->setISODate($annee, $semaine)->setTime(0, 0);
        $end = $start->modify('+6 days');

        // Charger toutes les présences de la semaine
        $results = $mapper->find([
            "WEEK(date_jour, 3) = ? AND YEAR(date_jour) = ?",
            $semaine,
            $annee
        ]) ?: [];

        $totalHeuresNormales = 0;
        $totalHeuresSupp = 0;

        foreach ($results as $presence) {
            $totalHeuresNormales += $presence->nb_operateurs * $presence->nb_heures_normales;
            $totalHeuresSupp += $presence->nb_operateurs * $presence->nb_heures_supp;
        }

        // Calcul des heures théoriques en excluant les fermetures
        $heures_theoriques = AtelierFermeturesModel::getHeuresTheoriquesSemaine($semaine, $annee);

        $totalOperateursEquivalents = $heures_theoriques > 0
            ? ($totalHeuresNormales + $totalHeuresSupp) / $heures_theoriques
            : 0;

        return [
            "heures_normales" => $totalHeuresNormales,
            "heures_supp" => $totalHeuresSupp,
            "heures_theoriques" => $heures_theoriques,
            "total_operateurs" => round($totalOperateursEquivalents, 2)
        ];
    }

    public static function joursManquants($semaine = null, $annee = null)
    {
        $semaine = $semaine ?? date('W');
        $annee = $annee ?? date('Y');

        // Déterminer les jours ouvrés (hors fermetures)
        $start = new DateTimeImmutable();
        $start = $start->setISODate($annee, $semaine);
        $end = $start->modify('+6 days');

        $jours_ouvres = [];
        $current = $start;
        while ($current <= $end) {
            if ((int)$current->format('N') <= 5) {
                $jours_ouvres[] = $current->format('Y-m-d');
            }
            $current = $current->modify('+1 day');
        }

        // Exclure les fermetures
        $fermetures = AtelierFermeturesModel::all();
        $jours_ouvrables = array_filter($jours_ouvres, function ($jour) use ($fermetures) {
            foreach ($fermetures as $periode) {
                if ($jour >= $periode['debut']->format('Y-m-d') && $jour <= $periode['fin']->format('Y-m-d')) {
                    return false;
                }
            }
            return true;
        });

        // Chercher les jours présents dans la base
        $mapper = new self();
        $presences = $mapper->find([
            "WEEK(date_jour, 3) = ? AND YEAR(date_jour) = ?",
            $semaine,
            $annee
        ]);

        $jours_saisis = [];

        if ($presences) {
            $jours_saisis = $presences
                ? array_unique(array_map(fn($p) => (new \DateTime($p->date_jour))->format('Y-m-d'), iterator_to_array($presences)))
                : [];
        }

        // Comparaison
        return array_values(array_diff($jours_ouvrables, $jours_saisis));
    }
}
