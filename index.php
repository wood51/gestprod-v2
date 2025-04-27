<?php

require("vendor/autoload.php");

$f3 = \Base::instance();


$f3->DEBUG = 3;

$f3->CACHE = true;
new Session(NULL,'CSRF');

$f3->AUTOLOAD = "app/core/helpers/"; // Mini pour charger la classe ModuleLoader

// Configurer la base de données MariaDB
try {
    $db_name = getenv('MARIADB_DATABASE');
    $db_user = getenv('MARIADB_USER');
    $db_password = getenv('MARIADB_PASSWORD');
    $db_host = getenv('MARIADB_HOST');

    $db = new \DB\SQL("mysql:host=$db_host;port=3306;dbname=$db_name", $db_user, $db_password);
    $f3->set('DB', $db);
} catch (PDOException $e) {
    die("Erreur de connexion à MariaDB : " . $e->getMessage());
}

// $f3->LANGUAGE='fr';
// $f3->LOCALES='app/dict/';
date_default_timezone_set('Europe/Paris');

\Flash::instance();

\ModuleLoader::instance();



$f3->run();