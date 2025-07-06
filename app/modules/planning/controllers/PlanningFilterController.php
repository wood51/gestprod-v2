<?php

class PlanningFilterController
{

    protected $service;

    public function __construct()
    {
        $this->service = new PlanningService();
    }

    /**
     * @route("POST /planning/filter/@col")
     */
    public function filterPlanning($f3,$param)
    {
        $col = $param['col']; // colonne 
        $formData = $f3->POST[$col] ?? []; // form data

        FilterHelper::makeFilter($col,$formData);

        $filtres = VuePlanningModel::get_filters([$col]); // ou avec des filtres
        $f3->set('reference', $filtres[$col]);
        $this->service->renderPartialPlanning();
    }

    /**
     * @route("POST /planning/sort")
     */
    public function sortPlanning($f3)
    {
        $col = isset($f3->POST['col']) ? $f3->POST['col'] : [];
        $order = (isset($f3->POST['order']) && (in_array($f3->POST['order'], ['asc', 'desc']))) ? $f3->POST['order'] : 'asc';
        FilterHelper::makeSort($col, $order);

        $filtres = VuePlanningModel::get_filters(['reference']); // ou avec des filtres
        $f3->set('reference', $filtres['reference']);
        $this->service->renderPartialPlanning();
    }

    /**
     * @route("GET /planning/filter/reset")
     */
    public function resetPlanningFilter($f3)
    {
        FilterHelper::resetFilter();

        $filtres = VuePlanningModel::get_filters(['reference']); // ou avec des filtres
        $f3->set('reference', $filtres['reference']);
        $this->service->renderPartialPlanning();
    }
}
