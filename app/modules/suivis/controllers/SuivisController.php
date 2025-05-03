<?php
class SuivisController
{



    /**
     * @route("GET /postes/@poste")
     */
    function poste($f3, $params)
    {
        $poste = $params['poste'];
        $poste = explode("-", $poste);
        $f3->poste = implode(" ", array_map(fn($value) => ucfirst($value), $poste));
        echo \Template::instance()->render("suivis/poste.html");
    }

    // /**
    //  * @route("GET /postes/menu")
    //  * rendu du partial menu poste
    //  */
    // function suivis_menu($f3)
    // {
    //     echo \Template::instance()->render("suivis/partials/_nav_postes.html");
    // }


    /**
     * @route("GET /postes")
     */
    function suivis_dashboard($f3)
    {
        $aside_menu = \Template::instance()->render("suivis/partials/_nav_postes.html");
        $content = \Template::instance()->render("suivis/dashboard-suivis.html");
        echo '<div id="aside_menu">' . $aside_menu . '</div>';
        echo '<div id="content" class="p-4">' . $content . '</div>';
    }
}
