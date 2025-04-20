<?php
class SuivisController {



    /**
     * @route("GET /suivis/@poste")
     */
    function poste($f3,$params) {
        $poste = $params['poste'];
        $poste = explode("-",$poste);
        $f3->poste = implode(" ",array_map(fn($value)=> ucfirst($value),$poste));
        echo \Template::instance()->render("suivis/poste.html");
    }

    /**
     * @route("GET /suivis/menu")
     * rendu du partial menu poste
     */
    function suivis_menu($f3) {
        echo \Template::instance()->render("suivis/partials/_nav_postes.html");
    }


    /**
     * @route("GET /suivis/dashboard")
     */
    function suivis_dashboard($f3) {
        echo \Template::instance()->render("suivis/dashboard-suivis.html");
    }
} 