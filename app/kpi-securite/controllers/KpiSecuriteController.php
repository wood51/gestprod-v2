<?php
class KpiSecuriteController
{
    /**
     * @route("GET /kpi/securite")
     */
    function kpi_securite($f3, $params)
    {
        $formatter = new \IntlDateFormatter(
            'fr_FR', // locale
            \IntlDateFormatter::LONG,
            \IntlDateFormatter::NONE,
            null, // timezone
            \IntlDateFormatter::GREGORIAN,
            'LLLL yyyy' // format personnalisé : mois complet + année
        );
        $now = new \DateTimeImmutable();
        $annee = (int)$now->format('Y');
        $mois = (int)$now->format('n');
        // $annee = $params['annee'];
        // $mois = $params['mois'];
        if ($mois < 1) {
            $mois = 12;
            $annee--;
        }
        if ($mois > 12) {
            $mois = 1;
            $annee++;
        }
        $max_case = 35;

        $semaines_fermees = [32, 33, 34];

        $fermeture_noel_start = new DateTimeImmutable('2025-12-25');
        $fermeture_noel_end = new DateTimeImmutable('2026-01-01');

        $joursAT = [2, 8];

        $feries = json_decode(
            file_get_contents('https://calendrier.api.gouv.fr/jours-feries/metropole.json'),
            true
        );

        $feries_mois = array_filter(array_keys($feries), function ($date) use ($annee, $mois) {
            return str_starts_with($date, sprintf('%04d-%02d', $annee, $mois));
        });



        $premier_jour_mois = new DateTimeImmutable("$annee-$mois-01");
        $nb_jours = (int) $premier_jour_mois->format("t");
        $first_day = (int) $premier_jour_mois->format('N'); // Lundi = 1

        $jours = [];

        for ($i = 0; $i < $max_case; $i++) {
            $jourDuMois = $i - ($first_day - 1) + 1; // car $first_day-1 cases vides avant le 1er

            if ($jourDuMois < 1 || $jourDuMois > $nb_jours) {
                // case vide
                $jours[] = [
                    'nb' => 0,
                    'at' => false,
                    'work' => false,
                ];
            } else {
                // case réelle
                $date = new DateTimeImmutable("$annee-$mois-$jourDuMois");
                $isFerie = in_array($date->format('Y-m-d'), $feries_mois);
                $weekNumber = (int)$date->format('W'); // Numéro de semaine
                $isInFermetureNoel = $date >= $fermeture_noel_start && $date <= $fermeture_noel_end;
                $isFerme = in_array($weekNumber, $semaines_fermees) || $isInFermetureNoel;
                $jours[] = [
                    'nb' => $jourDuMois,
                    'at' => in_array($jourDuMois, $joursAT),
                    'work' => (int)$date->format('N') <= 5, // lundi à vendredi
                    'ferie' => $isFerie,
                    'ferme' => $isFerme
                ];
            }
        }

        // Dump clean
        // echo "<pre>" . print_r($jours, true) . "</pre>";
        // die();
        $f3->calendar = [
            'mois' => ucfirst($formatter->format($premier_jour_mois)),
            'annee' => $annee,
            'mois_num' => $mois,
            'jours' => $jours
        ];

         echo Template::instance()->render("kpi-securite/kpi-securite.html");
        
    }
    /**
     * @route("GET /kpi/securite/@annee/@mois")
     */
    function kpi_securite_partial($f3, $params)
    {
        $formatter = new \IntlDateFormatter(
            'fr_FR', // locale
            \IntlDateFormatter::LONG,
            \IntlDateFormatter::NONE,
            null, // timezone
            \IntlDateFormatter::GREGORIAN,
            'LLLL yyyy' // format personnalisé : mois complet + année
        );
   
        $annee = $params['annee'];
        $mois = $params['mois'];
        if ($mois < 1) {
            $mois = 12;
            $annee--;
        }
        if ($mois > 12) {
            $mois = 1;
            $annee++;
        }
        $max_case = 35;

        $semaines_fermees = [32, 33, 34];

        $fermeture_noel_start = new DateTimeImmutable('2025-12-25');
        $fermeture_noel_end = new DateTimeImmutable('2026-01-01');

        $joursAT = [2, 8];

        $feries = json_decode(
            file_get_contents('https://calendrier.api.gouv.fr/jours-feries/metropole.json'),
            true
        );

        $feries_mois = array_filter(array_keys($feries), function ($date) use ($annee, $mois) {
            return str_starts_with($date, sprintf('%04d-%02d', $annee, $mois));
        });



        $premier_jour_mois = new DateTimeImmutable("$annee-$mois-01");
        $nb_jours = (int) $premier_jour_mois->format("t");
        $first_day = (int) $premier_jour_mois->format('N'); // Lundi = 1

        $jours = [];

        for ($i = 0; $i < $max_case; $i++) {
            $jourDuMois = $i - ($first_day - 1) + 1; // car $first_day-1 cases vides avant le 1er

            if ($jourDuMois < 1 || $jourDuMois > $nb_jours) {
                // case vide
                $jours[] = [
                    'nb' => 0,
                    'at' => false,
                    'work' => false,
                ];
            } else {
                // case réelle
                $date = new DateTimeImmutable("$annee-$mois-$jourDuMois");
                $isFerie = in_array($date->format('Y-m-d'), $feries_mois);
                $weekNumber = (int)$date->format('W'); // Numéro de semaine
                $isInFermetureNoel = $date >= $fermeture_noel_start && $date <= $fermeture_noel_end;
                $isFerme = in_array($weekNumber, $semaines_fermees) || $isInFermetureNoel;
                $jours[] = [
                    'nb' => $jourDuMois,
                    'at' => in_array($jourDuMois, $joursAT),
                    'work' => (int)$date->format('N') <= 5, // lundi à vendredi
                    'ferie' => $isFerie,
                    'ferme' => $isFerme
                ];
            }
        }

        // Dump clean
        // echo "<pre>" . print_r($jours, true) . "</pre>";
        // die();
        $f3->calendar = [
            'mois' => ucfirst($formatter->format($premier_jour_mois)),
            'annee' => $annee,
            'mois_num' => $mois,
            'jours' => $jours
        ];

         echo Template::instance()->render("kpi-securite/partials/_calendar.html");
        
    }
}
