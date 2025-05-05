<?php

class PlanningController
{

    /**
     * @route("POST /planning")
     */
    function test($f3)
    {
        $modeles_filter = $f3->POST['modeles'] ?? [];
        $sous_ensemble_filter = $f3->POST['types'] ?? [];

        // Récupère tous les modèles ->obliger de déstructure l'obj PDO pour ajouter le selected
        $modeles = [];
        foreach (SuivisArticlesModel::all() as $m) {
            $modeles[] = [
                '_id' => $m->_id,
                'reference' => $m->reference,
                'selected' => in_array($m->_id, $modeles_filter ?? []),
            ];
        }

        $sous_ensemble= [];
        foreach(SuivisTypeSousEnsemble::all() as $se) {
            $sous_ensemble[] = [
                '_id'=> $se->_id,
                'designation' => $se->designation,
                'selected' => in_array($se->_id, $sous_ensemble_filter ?? [])
            ];
        }
        $f3->types = $sous_ensemble;

        $f3->modeles = $modeles;

        $mapper  = new DB\Cortex(base::instance()->DB, "vue_prod_planning");
        // $global_filter= ! empty($modeles_filter) ? "fk_article in (?)" : "";
        // $global_filter= ! empty($sous_ensemble_filter) ? "fk_article in (?)" : "";
        // $global_var= 

        // $f3->produits = $mapper->find(["fk_article in (?)", $modeles_filter], ["order" => "id DESC"]);
        $f3->produits = $mapper->find(["fk_type_sous_ensemble in (?)", $sous_ensemble_filter], ["order" => "id DESC"]);
        echo \template::instance()->render("kpi-dashboard/partials/_planning_table.html");
    }
}
