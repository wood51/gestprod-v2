<?php
class ChartController
{
    /**
     * @route("GET /public/dashboard")
     */
    function kpi_dashboad($f3)
    {
        $f3->week = "2025-21";//(DateHelper::build(2025,21))->full_week;
        $f3->nb_semaine = 5;
        echo \template::instance()->render("kpi-dashboard/kpi_dashboard.html");
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
