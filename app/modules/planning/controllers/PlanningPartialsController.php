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
     * @route("GET /modal/engagement-multiple")
     */
    function modalEngagementMultiple($f3,$params)
    {
        echo \Template::instance()->render('/planning/partials/_planning_form_engagement_multiple.html');
    }

    /**
     * @route("GET /modal/report/@produit")
     */
    function modalReport($f3,$params)
    {
        $f3->produit = VuePlanningModel::findById($params['produit']);
        echo \Template::instance()->render('/planning/partials/_planning_form_report.html');
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

    /**
 * @route("GET /modal/planning/valider/@id")
 */
function modalValiderProduit($f3, $params)
{
    $mapper = new \DB\SQL\Mapper($f3->get('DB'), 'prod_planning');
    $mapper->load(['id = ?', $params['id']]);

    if ($mapper->dry()) {
        http_response_code(404);
        echo 'Produit introuvable';
        return;
    }

    $f3->set('produit', $mapper);
    echo \Template::instance()->render('/planning/partials/_planning_form_valider.html');
}


}
