<?php

require("vendor/autoload.php");

$f3 = \Base::instance();

$f3->DEBUG = 3;

$f3->AUTOLOAD = "app/core/helpers/";

\ModuleLoader::instance();

$f3->run();