<?php
class PageController extends BaseController
{

    /**
     * @route("GET /")
     */
    function dashboard()
    {
        echo Template::instance()->render('templates/dashboard/dashboard.html');
    }

    /**
     * @route("GET /admin")
     */
    function admin($f3)
    {
        $f3->set('content', "");
        echo Template::instance()->render('templates/admin/admin.html');
    }

    /**
     * @route("GET /admin/planning")
     */
    function articles()
    {
        echo Template::instance()->render('templates/admin/planning.html');
    }
}
