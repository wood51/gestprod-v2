<?php

require("vendor/autoload.php");

$f3 = \Base::instance();
$f3->set('DEBUG', 3);

$f3->AUTOLOAD = "app/controllers/|app/services/|app/models/";
$f3->UI = "app/views/";

$f3->route("GET /",'MainController->index');

$f3->run();

