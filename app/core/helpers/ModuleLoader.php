<?php

class ModuleLoader extends \Prefab
{

    function __construct()
    {
        // Instance FatFree
        $f3 = \Base::instance();

        // Chargement des chemins autoload du core 
        $f3->AUTOLOAD .=
            "|app/core/controllers/|" .
            "app/core/models/|" .
            "app/core/services/|" .
            "app/core/tests/";

        $f3->UI = "app/views/|app/core/views/";

        $autoload = "|";
        $ui = "|";
        foreach (glob("app/*", GLOB_ONLYDIR) as $dir) {

            $module_name = basename($dir);
            $module_config_path = "$dir/module.json";

            $execptions = ["configs", "logs", "views", "core"];
            $autoload_dirs = ["controllers", "helpers", "models", "services", "tests"];

            if (
                in_array($module_name, $execptions)
                || !file_exists($module_config_path)
            ) continue;

            $conf = json_decode(file_get_contents($module_config_path));

            if ($conf->enabled) {
                foreach ($autoload_dirs as $subdir) {
                    if (is_dir("$dir/$subdir")) {
                        $autoload .= "$dir/$subdir/|";
                    }
                }

                if (is_dir("$dir/views")) {
                    $ui .= "$dir/views/|";
                }
            }
        }

        $f3->UI .= rtrim($ui, "|");
        $f3->AUTOLOAD .= rtrim($autoload, "|");

        // Création des logs
        $f3->LOGS = "app/logs/";
        $f3->debug_log = new Log('debug.log');
        $f3->error_log = new Log('error.log');

        // Ici instanciation de tous les plugins f3 nécessaire 
        Falsum\Run::handler();;
        \AnnotationRoutingPlugin::instance();
    }
}
