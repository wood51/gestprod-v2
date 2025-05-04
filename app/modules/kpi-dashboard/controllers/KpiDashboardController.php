<?php
class KpiDashboardController {

    /**
     * @route("GET /kpi/dashboard")
     */
    function kpi_dashboad($f3) {
        echo \template::instance()->render("kpi-dashboard/kpi_dashboard.html");
    }

    /**
     * @route("GET /admin/kpi/dashboard")
     */
    function kpi_dashboad_admin($f3) {
        $mapper  = new DB\Cortex(base::instance()->DB,"vue_prod_planning");
        $f3->modeles = SuivisArticlesModel::all();
        $f3->produits = $mapper->find(null,['order'=>'id DESC']);
        echo \template::instance()->render("kpi-dashboard/kpi_dashboard_admin.html");
    }
}