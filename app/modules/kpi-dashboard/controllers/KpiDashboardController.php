<?php
class KpiDashboardController
{

    /**
     * @route("GET /kpi/dashboard")
     */
    function kpi_dashboad($f3)
    {
        echo \template::instance()->render("kpi-dashboard/kpi_dashboard.html");
    }

    /**
     * @route("GET /admin/kpi/dashboard")
     */
    function kpi_dashboad_admin($f3)
    {

        // Récupère tous les modèles ->obliger de déstructure l'obj PDO pour ajouter le selected
        $modeles = [];
        foreach (SuivisArticlesModel::all() as $m) {
            $modeles[] = [
                '_id' => $m->_id,
                'reference' => $m->reference,
                'selected' => true
            ];
        }
        $f3->modeles = $modeles;

        $sous_ensemble = [];
        foreach (SuivisTypeSousEnsemble::all() as $se) {
            $sous_ensemble[] = [
                '_id' => $se->_id,
                'designation' => $se->designation,
                'selected' => true
            ];
        }
        $f3->types = $sous_ensemble;

        $mapper  = new DB\Cortex(base::instance()->DB, "vue_prod_planning");
        $f3->produits = $mapper->find(null, ['order' => 'id DESC']);

        echo \template::instance()->render("kpi-dashboard/kpi_dashboard_admin.html");
    }
}
