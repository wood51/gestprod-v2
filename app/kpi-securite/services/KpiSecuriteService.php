<?php
class KpiSecuriteService
{
    private array $joursFeries = [];

    function __construct()
    {
        $this->joursFeries = array_keys(json_decode(
            file_get_contents('https://calendrier.api.gouv.fr/jours-feries/metropole.json'),
            true
        ));
    }


    function isFermeture(DateTimeImmutable $date_obj)
    {
        $fermetures = ConfigFermeturesModel::all();

        foreach ($fermetures as $fermeture) {
            if ($date_obj >= $fermeture['debut'] && $date_obj <= $fermeture['fin']) {
                return true;
            }
        }

        return false;
    }

    function isOuvrable($date)
    {
        //$date = "2025-08-14"; // tu fixes ici pour ton test
        $dateObj = new DateTimeImmutable($date);

        // 1. Week-end ?
        $isWeekend = (int)$dateObj->format("N") > 5;


        $isFerie = in_array($date, $this->joursFeries);

        $isFermeture =  $this->isFermeture(new DateTimeImmutable($date));

        // Résultat final
        $isOuvrable = !$isWeekend && !$isFerie && !$isFermeture;


        return $isOuvrable;
    }

    function nb_jours_sans_at()
    {
        $dernier_arret = new DateTimeImmutable(AccidentsTravailModel::last_accident());
        $now = new DateTimeImmutable();

        $count = 0;
        $date = $dernier_arret->modify('+1 day'); // commencer le lendemain de l'accident

        while ($date <= $now) {
            if ($this->isOuvrable($date->format('Y-m-d'))) {
                $count++;
            }
            $date = $date->modify('+1 day');
        }

        return $count;
    }

    function record_sans_at()
    {
        $dates_arrets = array_column(AccidentsTravailModel::all(), 'date');


        $record = [
            'nb_jours' => 0,
            'debut' => null,
            'fin' => null
        ];

        for ($i = 0; $i < count($dates_arrets) - 1; $i++) {
            $debut = new DateTimeImmutable($dates_arrets[$i]);
            $fin = new DateTimeImmutable($dates_arrets[$i + 1]);

            $nb_jours = 0;
            $current = $debut->modify('+1 day');

            for (; $current < $fin; $current = $current->modify('+1 day')) {
                if ($this->isOuvrable($current->format('Y-m-d'))) {
                    $nb_jours++;
                }
            }

            if ($nb_jours > $record['nb_jours']) {
                $record = [ // pour utlisé dans les templates
                    'nb_jours' => $nb_jours,
                    'debut' => $debut->format('d/m/Y'),
                    'fin' => $fin->format('d/m/Y')
                ];
            }
        }

        return $record;
    }

    function createCalendar($annee = null, $mois = null)
    {
        $jours = [];
        $max_case = 42;
        $now = DateHelper::build($annee, $mois);
        $joursAT = AccidentsTravailModel::accidents($now->annee, $now->mois);
        $feries_mois = DateHelper::get_ferries($now->annee, $now->mois);
        $prevDate = $now->datetime->modify('-1 month');
        $nextDate = $now->datetime->modify('+1 month');

        for ($i = 0; $i < $max_case; $i++) {
            $jourDuMois = $i - ($now->first_day_of_month - 1) + 1; // car $now->first_day_of_month - 1 -> cases vides avant le 1er

            $isVide = ($jourDuMois < 1 || $jourDuMois >  $now->nb_jours_mois);

            $date = $now->premier_jour_mois->modify('+' . ($jourDuMois - 1) . ' days');

            $info = [
                'nb' => 0,
                'at' => false,
                'work' => false,
                'ferie' => false,
                'ferme' => false,
                'aujourdhui' => false
            ];

            if (!$isVide) {
                $info = [
                    'nb' => $jourDuMois,
                    'at' => in_array($jourDuMois, $joursAT),
                    'work' => (int)$date->format('N') <= 5,
                    'ferie' => in_array($date->format('Y-m-d'), $feries_mois),
                    'ferme' => $this->isFermeture($date),
                    'aujourdhui' => $date->format('Y-m-d') === $now->aujourdhui
                ];
            }

            $jours[] = $info;
        }

        return [
            'month_name' => ucfirst(DateHelper::get_month_name($now->annee, $now->mois)),
            'year' => $now->annee,
            'month' => $now->mois,
            'days' => $jours,
            'prev_year' => (int)$prevDate->format('Y'),
            'prev_month' => (int)$prevDate->format('n'),
            'next_year' => (int)$nextDate->format('Y'),
            'next_month' => (int)$nextDate->format('n'),
        ];
    }
}
