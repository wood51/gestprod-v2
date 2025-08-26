<?php
class KpiController
{

    /**
     * @route("GET /kpi")
     */
    public function kpi()
    {
        echo \Template::instance()->render('kpi/kpi.html');
    }
}
