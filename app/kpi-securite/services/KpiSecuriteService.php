<?php
class KpiSecuriteService
{
    function get_last_arret()
    {
        $dernier_arret = AccidentsTravailModel::last_accident();
        $now = DateHelper::build();
        $daysSince = ($dernier_arret)
            ? (new DateTimeImmutable($dernier_arret))->diff(new DateTimeImmutable($now->aujourdhui))->days
            : null;
        return $daysSince;
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
