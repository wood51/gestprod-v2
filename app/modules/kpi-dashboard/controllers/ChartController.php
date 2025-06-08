<?php
class ChartController
{
    /**
     * @route("GET /public/dashboard")
     */
    function kpi_dashboad($f3)
    {
        $now = DateHelper::build();
        $week = $f3->SESSION['semaine-kpi'] ?? $now->full_week;

        $f3->now = $now;
        $f3->week = $week;
        $f3->week_picker = DateHelper::toWeekPickerFormat($week);
        $f3->max_week_picker = DateHelper::toWeekPickerFormat($now->full_week);
        $f3->nb_semaine = 5;

        echo \template::instance()->render("kpi-dashboard/kpi_dashboard.html");
    }



    /**
     * @route("POST /public/dashboard/set-date")
     */
    function setDate($f3)
    {
        echo  $f3->SESSION['semaine-kpi'];
        $data = (object) $f3->POST;
        if ($data && isset($data->semaine)) {
            if (preg_match('/^\d{4}-W\d{2}$/', $data->semaine)) {
                $f3->SESSION['semaine-kpi'] = str_replace('-W', '-', $data->semaine);
                header('HX-Trigger: reload-page');
                exit();
            }
        }
    }

    /**
     * @route("GET /debug/kpi-presence")
     */
    public function kpiPresence($f3)
    {
        $semaine = $f3->GET['semaine'] ?? date('W');
        $annee = $f3->GET['annee'] ?? date('Y');

        $stats = PresenceService::getNbOperateursSemaine($semaine, $annee);
        $manquants = PresenceService::joursManquants($semaine, $annee);

        echo \Template::instance()->render('kpi-dashboard/debug/kpi_presence.html', 'text/html', [
            'stats' => $stats,
            'manquants' => $manquants,
            'semaine' => $semaine,
            'annee' => $annee
        ]);
    }
}
