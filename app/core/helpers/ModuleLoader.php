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

        $f3->UI = "app/views/";

        $autoload = "|";
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
            }
        }

        $f3->AUTOLOAD .= rtrim($autoload, "|");

        // Création des logs
        $f3->LOGS = "app/logs/";
        $f3->debug_log = new Log('debug.log');
        $f3->error_log = new Log('error.log');

        // Ici instanciation de tous les plugins f3 nécessaire 
        Falsum\Run::handler();

        \CoreMiddlewareService::base_middleware();
        //$f3->CORTEX['standardiseID']=false;

        $validation = \Validation::instance();
        $validation->loadLang();

        $validation->onError(function ($text, $key) {
            \Base::instance()->set('error.' . $key, $text);
            \Flash::instance()->addMessage($text, 'error');
            header("HX-Trigger: showFlash");
            http_response_code(204);
        });

        \AnnotationRoutingPlugin::instance();
    }
}
