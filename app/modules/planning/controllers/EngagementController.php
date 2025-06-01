<?php
class EngagementController
{
    protected $service;

    public function __construct()
    {
        $this->service = new EngagementService();
    }

    /**
     * @route("POST /planning/engagement")
     * Met à jour le statut d'engagement d'un produit selon les données POST
     * @param Base $f3 Instance du framework Fat-Free
     */
    public function planning_engagement($f3)
    {
        // $data = $this->service->cleanData($f3->POST);
        $data = (object) $f3->POST;
        try {
            $this->service->engager($data);
        } catch (\Exception $e) {
            $f3->error($e->getCode(), $e->getMessage());
        }
        $planning = new PlanningService();
        $planning->renderPartialPlanning();
        echo \Template::instance()->render('themes/base/partials/_modal_clear.html');
    }

    /**
     * @route("POST /planning/engagement/multiple")
     * Met à jour le statut d'engagement d'un produit selon les données POST
     * @param Base $f3 Instance du framework Fat-Free
     */
    public function planningEngagementMultiple($f3) {
        $data = $f3->POST;
        echo var_dump($data['select']);
    }
}
