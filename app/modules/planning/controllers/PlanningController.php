<?php

class PlanningController
{
    protected $service;

    public function __construct()
    {
        $this->service = new PlanningService();
    }

    /**
     * @route("GET /admin/planning/dashboard")
     */
    function planningDashboard($f3)
    {

        // Init Etat initial en session
        $f3->SESSION['filter_pret'] = false;
        $f3->SESSION['pagination_page'] = 0;
        $f3->SESSION['pagination_limit'] = 15;

        // Init Form Ajout 
        $f3->types = $this->service->getAvailableTypes(['Alternateur', 'Compresseur']); // Recup différent type
        $f3->mset($this->service->getRefsByType('Alternateur'));

        // Init template 
        $f3->filter_pret = false; // retour checkbox Prêt ?
        $f3->mset($this->service->getNowInfo());
        $f3->mset($this->service->paginatePlanning(0, 15, false));

        echo \Template::instance()->render("planning/planning_dashboard.html");
    }


    /**
     * @route("POST /planning/produit/add")
     * 
     */
    function planning_add($f3)
    {


        $this->service->addProduit([
            'type' => (int) $f3->POST['type'],
            'reference' => (int) $f3->POST['reference'],
            'semaine' => str_replace("W", "", $f3->POST['semaine'])
        ]);

        $f3->SESSION['pagination_page'] = 0;

        $this->service->renderPartialPlanning();
    }

    /**
     * @route("GET /planning/filter/pret")
     */
    public function setFilterPret($f3)
    {
        $filter_pret = isset($f3->GET['filter_pret']) ? true : false;
        $f3->SESSION['filter_pret'] = $filter_pret;
        $this->service->renderPartialPlanning();
    }

    /**
     * @route("GET /planning/page/@page")
     */
    public function setPlanningPage($f3, $params)
    {
        $f3->SESSION['pagination_page'] = intval($params['page']) - 1;
        $this->service->renderPartialPlanning();
    }

    /**
     * @route("POST /planning/check-numero")
     */
    public function checkNumero($f3)
    {
        $key = array_key_first($f3->POST);
        $numero = $f3->POST[$key];
        $planningId = explode('-', $key)[1];

        $isUnique = ProdPlanningModel::isNumeroUnique($planningId, $numero);

        header('Content-Type: application/json');
        echo json_encode(['unique' => $isUnique]);
    }
}
