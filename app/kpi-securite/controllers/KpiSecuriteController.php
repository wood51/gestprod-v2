<?php
class KpiSecuriteController
{
    protected $service;

    function __construct()
    {
        $this->service = new KpiSecuriteService();
    }

    /**
     * @route("GET /kpi/securite")
     */
    function kpi_securite($f3, $params)
    {
        $f3->daysSince = $this->service->nb_jours_sans_at(); 
        $f3->record = $this->service->record_sans_at();
        $f3->calendar = $this->service->createCalendar();
        echo Template::instance()->render("kpi-securite/kpi-securite.html");
    }


    /**
     * @route("GET /kpi/securite/@annee/@mois")
     */
    function kpi_securite_partial($f3, $params)
    {
        $annee = $params['annee'];
        $mois = $params['mois'];

        $f3->calendar = $this->service->createCalendar($annee, $mois);
        echo Template::instance()->render("kpi-securite/partials/_calendar.html");
    }

    
}
