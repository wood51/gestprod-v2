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
     * @route("GET /kpi/securite/indicateurs")
     */
    function indicateurs($f3)
    {
        $f3->daySince= $this->service->nb_jours_sans_at();
        $f3->record= $this->service->record_sans_at();
        echo Template::instance()->render('kpi-securite/partials/_indicateurs.html');
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

    /**
     * @route("GET /kpi/securite/accident-form/@date")
     */
    function accidentForm($f3, $params)
    {
        $date = $params['date'];

        // Va chercher l'accident si existe pour cette date
        $accident = AccidentsTravailModel::find_by_date($date);
        $f3->ssts = UsersModel::all_sst();
        $f3->users = UsersModel::all();
        $f3->operations = AtelierOperationModel::all();

        $f3->date = $date;
        $f3->accident = $accident;

        echo Template::instance()->render('kpi-securite/partials/_accident_form.html');
    }

    /**
     * @route("POST /kpi/securite/accident-save")
     */
    function accidentSave($f3)
    {
        // Mode pompier 
        // TODO save dans le model , validation des data
        // AMELIO : gerer plusieurs accident par jours (peut $etre badge pour signaler)

        $data = $f3->POST;
        $date = new DateTimeImmutable($data['date']);

        $mapper = new AccidentsTravailModel();

        $mapper->load(['date = ?', $data['date']]);
        $mapper->copyfrom($data);
        $mapper->save();

        $f3->daysSince = $this->service->nb_jours_sans_at();
        $f3->record = $this->service->record_sans_at();

        $f3->calendar = $this->service->createCalendar($date->format('Y'), $date->format('m'));
        $calendar = Template::instance()->render("kpi-securite/partials/_calendar.html");
        $indicateurs = Template::instance()->render('kpi-securite/partials/_indicateurs.html');
        echo $indicateurs.$calendar;
    }

    /**
     * @route("POST /kpi/securite/accident-delete")
     */
    function accidentDelete($f3)
    {
        $data = $f3->POST;
        $date = new DateTimeImmutable($data['date']);

        if (!empty($data['date'])) {
            $mapper = new AccidentsTravailModel();
            $mapper->load(['date = ?', $data['date']]);
            if (!$mapper->dry()) {
                $mapper->erase();
            }
        }

        // $f3->calendar = $this->service->createCalendar($date->format('Y'), $date->format('m'));

        // echo Template::instance()->render("kpi-securite/partials/_calendar.html");
        $f3->daysSince = $this->service->nb_jours_sans_at();
        $f3->record = $this->service->record_sans_at();

        $f3->calendar = $this->service->createCalendar($date->format('Y'), $date->format('m'));
        $calendar = Template::instance()->render("kpi-securite/partials/_calendar.html");
        $indicateurs = Template::instance()->render('kpi-securite/partials/_indicateurs.html');
        echo $indicateurs.$calendar;
    }

    
}
