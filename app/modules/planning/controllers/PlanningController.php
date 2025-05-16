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
        
        $produits_pret = (bool)isset($f3->GET['pret']);
        $f3->filter_pret = $produits_pret ? true : false;

        $f3->mset($this->service->getNowInfo());
        $f3->mset($this->service->paginatePlanning(0, 15, $produits_pret));

        echo \Template::instance()->render("planning/partials/_planning_table.html");
    }
}
