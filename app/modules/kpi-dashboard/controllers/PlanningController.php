<?php

class PlanningController
{

    /**
     * @route("POST /planning/engagement") 
     */
     function planning_update_engagement($f3)
     {
        $patch = array_keys($f3->POST);
        echo var_dump($patch);
        foreach ($patch as $p) {
            echo $p;
        }
     }
}