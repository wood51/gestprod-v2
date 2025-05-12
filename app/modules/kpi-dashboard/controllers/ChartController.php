<?php
class ChartController
{
    /**
     * @route("GET /public/dashboard")
     */
    function kpi_dashboad($f3)
    {
        echo \template::instance()->render("kpi-dashboard/kpi_dashboard.html");
    }

}
