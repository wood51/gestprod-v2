<?php

require("vendor/autoload.php");
require_once("app/hello/controllers/HelloController.php");

$f3 = \Base::instance();

$f3->DEBUG = 3;

$f3->AUTOLOAD = "app/core/helpers/";

\CoreLoader::instance();

// $f3->route("GET /hello" , "HelloController->index");

$f3->run();