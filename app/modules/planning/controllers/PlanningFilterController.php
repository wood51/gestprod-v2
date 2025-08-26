<?php

class PlanningFilterController
{

    protected $service,$table,$filtered_col;


    public function __construct()
    {
        $this->service = new PlanningService();
        $this->table = 'vue_prod_planning';
        $this->filtered_col = ['reference','type','numero'];
    }

    /**
     * @route("POST /planning/filter/@col")
     */
    public function filterPlanning($f3,$param)
    {
        $col = $param['col']; // colonne 
        $formData = $f3->POST[$col] ?? []; // form data

        FilterHelper::makeFilter($col,$formData);

        //$filtres = VuePlanningModel::get_filters([$col]); // ou avec des filtres
        $filtres = FilterHelper::get_filters($this->table,$this->filtered_col); // ou avec des filtres // BUG ici on renvoie qu'un filter type ou ref alors qu'il y en as 2 (interdépendance des deux)
        $f3->filtres = $filtres;
        $f3->set($col, $filtres[$col]);
        $this->service->renderPartialPlanning();
    }

    /**
     * @route("GET /planning/sort/@col/@order")
     */
    public function sortPlanning($f3,$param)
    {
        $col = $param['col'] ?? [];
        $order = $param['order'] ?? 'asc'; 
        FilterHelper::makeSort($col, $order);

        //$filtres = VuePlanningModel::get_filters([$col]); // ou avec des filtres
        $filtres = FilterHelper::get_filters($this->table, $this->filtered_col); // ou avec des filtres
        $f3->filtres = $filtres;
        $f3->set($col, $filtres[$col]);
        $this->service->renderPartialPlanning();
    }

    /**
     * @route("GET /planning/filter/reset")
     */
    public function resetPlanningFilter($f3)
    {
        FilterHelper::resetFilter();

        // $filtres = VuePlanningModel::get_filters(['reference']); // ou avec des filtres
        $filtres = FilterHelper::get_filters($this->table,$this->filtered_col); // ou avec des filtres
        $f3->filtres = $filtres;
        // $f3->set('reference', $filtres['reference']);
        // $f3->set('type', $filtres['type']);
        $this->service->renderPartialPlanning();
    }

    
}
