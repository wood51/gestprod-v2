<?php
class PlanningPartialsController extends PlanningController
{

    /**
     * @route("GET /planning/partials/@limit/@page")
     * @deprecated
     */
    function paginatedPlanning($f3, $params)
    {
        // Récuperation paramètres
        $page = (int)$params['page'] - 1;
        $limit = (int) $params['limit'];
        $produits_pret = (bool)isset($f3->GET['filter-pret']); // état checkbox Prêt ?
        $f3->filter_pret = $produits_pret ? true : false; // retour checkbox Prêt ?

        $this->service->renderPartialPlanning($page, $limit, $produits_pret);
    }

    /**
     * @route("GET /planning/partials/type/refs")
     */
    function getRefs($f3)
    {
        $type = (int)$f3->GET['type'];
        $f3->mset($this->service->getRefsByType($type));
        echo \Template::instance()->render('/planning/partials/_planning_form_refs.html');
    }

    /**
     * @route("GET /modal/engagement/@produit")
     */
    function modalEngagement($f3,$params)
    {
        $f3->produit = VuePlanningModel::findById($params['produit']);
       // echo var_dump($f3->produit);die();
        echo \Template::instance()->render('/planning/partials/_planning_form_engagement.html');
    }

    /**
     * @route("GET /modal/planning-add")
     */
    function modalPlanningAdd($f3)
    {
        // Init Form Ajout 
        $f3->types = $this->service->getAvailableTypes(['Alternateur','Compresseur','Redresseur']);
        $f3->mset($this->service->getRefsByType('Alternateur'));
        echo \Template::instance()->render('/planning/partials/_planning_form_add.html');
    }


}
