<?php

class PresenceService
{
    /**
     * Calcule les heures théoriques d'une semaine, en excluant fériés/fermetures.
     */
    public static function getHeuresTheoriquesSemaine($semaine, $annee)
    {
        $kpi = new \KpiSecuriteService();
        $heures = 0;

        $start = new DateTimeImmutable();
        $start = $start->setISODate($annee, $semaine);
        $end = $start->modify('+6 days');

        $current = $start;
        while ($current <= $end) {
            $date = $current->format('Y-m-d');
            if ($kpi->isOuvrable($date)) {
                $heures += ($current->format('N') == 5) ? 4.75 : 8.75;
            }
            $current = $current->modify('+1 day');
        }

        return $heures;
    }

    /**
     * Calcule le nombre d'opérateurs équivalents.
     */
    public static function getNbOperateursSemaine($semaine = null, $annee = null)
    {
        $semaine = $semaine ?? date('W');
        $annee = $annee ?? date('Y');
        $mapper = new \PresenceModel();

        $results = $mapper->find([
            "WEEK(date_jour, 3) = ? AND YEAR(date_jour) = ?",
            $semaine, $annee
        ]) ?: [];

        $totalHeuresNormales = 0;
        $totalHeuresSupp = 0;

        foreach ($results as $presence) {
            $totalHeuresNormales += $presence->nb_operateurs * $presence->nb_heures_normales;
            $totalHeuresSupp += $presence->nb_operateurs * $presence->nb_heures_supp;
        }

        $heures_theo = self::getHeuresTheoriquesSemaine($semaine, $annee);

        return [
            "heures_normales" => $totalHeuresNormales,
            "heures_supp" => $totalHeuresSupp,
            "heures_theoriques" => $heures_theo,
            "total_operateurs" => $heures_theo > 0
                ? round(($totalHeuresNormales + $totalHeuresSupp) / $heures_theo, 2)
                : 0
        ];
    }

    /**
     * Liste les jours manquants dans la saisie de présence.
     */
    public static function joursManquants($semaine = null, $annee = null)
    {
        $semaine = $semaine ?? date('W');
        $annee = $annee ?? date('Y');

        $start = new DateTimeImmutable();
        $start = $start->setISODate($annee, $semaine);
        $end = $start->modify('+6 days');

        $jours_ouvrables = [];
        $securite = new \KpiSecuriteService();

        $current = $start;
        while ($current <= $end) {
            $date = $current->format('Y-m-d');
            if ($securite->isOuvrable($date)) {
                $jours_ouvrables[] = $date;
            }
            $current = $current->modify('+1 day');
        }

        $mapper = new \PresenceModel();
        $presences = $mapper->find([
            "WEEK(date_jour, 3) = ? AND YEAR(date_jour) = ?",
            $semaine, $annee
        ]) ?: [];

        $jours_saisis = array_unique(array_map(
            fn($p) => (new \DateTimeImmutable($p->date_jour))->format('Y-m-d'),
            iterator_to_array($presences)
        ));

        return array_values(array_diff($jours_ouvrables, $jours_saisis));
    }
}
