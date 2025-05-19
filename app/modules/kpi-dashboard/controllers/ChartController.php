<?php
class ChartController
{
    /**
     * @route("GET /public/dashboard")
     */
    function kpi_dashboad($f3)
    {
        $f3->week="2025-20";
        $f3->nb_semaine = 5;
        echo \template::instance()->render("kpi-dashboard/kpi_dashboard.html");
    }

}
