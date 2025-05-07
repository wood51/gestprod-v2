<?php
class KpiDashboardController
{

    /**
     * @route("GET /kpi/dashboard")
     */
    function kpi_dashboad($f3)
    {
        echo \template::instance()->render("kpi-dashboard/kpi_dashboard.html");
    }

    /**
     * @route("GET /admin/kpi/dashboard")
     */
    function kpi_dashboad_admin($f3)
    {
        $limit = 15;
        $pagination = VuePlanningModel::paginate_all(0,$limit);
        $f3->pages = range(1, $pagination['count']);
        $f3->pos = $pagination['pos']+1;
        $f3->limit = $pagination['limit'];
        $f3->produits = $pagination['subset'];
        

        echo \Template::instance()->render("kpi-dashboard/kpi_dashboard_admin.html");
    }

    /**
     * @route("GET /planning/@limit/@page")
     */
    function paginated_planning($f3, $params)
    {
        $page = (int)$params['page'] - 1;
        $limit =(int) $params['limit'];


        $pagination = VuePlanningModel::paginate_all($page, $limit);
        $f3->pages = range(1, $pagination['count']);
        $f3->pos = $pagination['pos']+1;
        $f3->limit = $pagination['limit'];
        $f3->produits = $pagination['subset'];

        echo \Template::instance()->render("kpi-dashboard/partials/_planning_table.html");
    }
}
