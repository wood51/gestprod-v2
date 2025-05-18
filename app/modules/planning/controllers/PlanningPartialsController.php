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
}
