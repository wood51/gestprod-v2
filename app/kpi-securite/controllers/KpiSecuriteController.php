<?php
class KpiSecuriteController {
    /**
     * @route("GET /kpi/securite")
     */
    function kpi_securite($f3) {
        echo Template::instance()->render("kpi-securite/kpi-securite.html");
    }
}