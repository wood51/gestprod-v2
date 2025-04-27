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
        $f3->daysSince = $this->service->get_last_arret(); // ajouter services
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

    /**
     * @route("GET /ouvrable")
     */
    function isOuvrable($date)
    {
        //$date = "2025-08-14"; // tu fixes ici pour ton test
        $dateObj = new DateTimeImmutable($date);

        // 1. Week-end ?
        $isWeekend = (int)$dateObj->format("N") > 5;

        // 2. Jour férié ?
        $feries = array_keys(json_decode(
            file_get_contents('https://calendrier.api.gouv.fr/jours-feries/metropole.json'),
            true
        ));
        $isFerie = in_array($date, $feries);

        $isFermeture =  $this->service->isFermeture(new DateTimeImmutable($date));

        // Résultat final
        $isOuvrable = !$isWeekend && !$isFerie && !$isFermeture;

        // var_dump([
        //     'date' => $date,
        //     'isWeekend' => $isWeekend,
        //     'isFerie' => $isFerie,
        //     'isFermeture' => $isFermeture,
        //     'isOuvrable' => $isOuvrable
        // ]);

        return $isOuvrable;
    }

    /**
     * @route("GET /jours")
     */
    function nb_jours_sans_at()
    {
        $dernier_arret = new DateTimeImmutable(AccidentsTravailModel::last_accident());
        $now = new DateTimeImmutable();
    
        $count = 0;
        $date = $dernier_arret->modify('+1 day'); // commencer le lendemain de l'accident
       
        while ($date <= $now) {
            if ($this->isOuvrable($date->format('Y-m-d'))) {
                $count++;
            }
            $date = $date->modify('+1 day');
        }
    
        echo $count;
    }
    
}
