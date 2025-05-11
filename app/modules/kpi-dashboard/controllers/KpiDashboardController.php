<?php
class KpiDashboardController
{

    /**
     * @route("GET /test")
     */
    function test_form($f3)
    {
        $f3->types = ProdTypeSousEnsembleModel::find_type(['Alternateur', 'Compresseur']);
        $fk_articles = ProdGroupeSousEnsembleModel::get_refs_by_type(6);
        $refs = [];
        foreach ($fk_articles as $fk_article) {
            $refs[] = [
                '_id' => $fk_article->_id,
                'reference' => ProdArticlesModel::get_by_id($fk_article->_id)->reference
            ];
        }
        $f3->refs = $refs;
        echo Template::instance()->render("kpi-dashboard/partials/_planning_form_add.html");
    }

    /**
     * @route("GET /test/type/refs")
     */
    function get_ref($f3)
    {
        $type = $f3->GET['type'];
        $fk_articles = ProdGroupeSousEnsembleModel::get_refs_by_type($type);
        $refs = [];
        foreach ($fk_articles as $fk_article) {
            $refs[] = [
                '_id' => $fk_article->_id,
                'reference' => ProdArticlesModel::get_by_id($fk_article->_id)->reference
            ];
        }

        $f3->refs = $refs;
        echo \Template::instance()->render('/kpi-dashboard/partials/_planning_form_refs.html');
    }

    /**
     * @route("GET /public/dashboard")
     */
    function kpi_dashboad($f3)
    {
        echo \template::instance()->render("kpi-dashboard/kpi_dashboard.html");
    }

    /**
     * @route("POST /test/save")
     * 
     */
    function planning_add($f3)
    {

        $data = [
            'type' => (int) $f3->POST['type'],
            'reference' => (int) $f3->POST['reference'],
            'semaine' => str_replace("W", "", $f3->POST['semaine'])
        ];
        $last_id = ProdPlanningModel::add($data);

        // Pagination 
        $limit = 15;
        $produits_pret = (bool)isset($f3->GET['pret']);
        $f3->filter_pret = $produits_pret ? true : false;
        $filter = $produits_pret ? null : ['prete = ?', 0];
        $pagination = VuePlanningModel::paginate_all(0, $limit, $filter);
        $f3->pages = range(1, $pagination['count']);
        $f3->pos = $pagination['pos'] + 1;
        $f3->limit = $pagination['limit'];
        $f3->produits = $pagination['subset'];

        $f3->now = (new DateTimeImmutable())->format('Y-W');
        $f3->now_iso = (new DateTimeImmutable())->format('Y-\WW');
        $f3->set('filter_pret', isset($f3->GET['pret']) ? true : false);

        echo \Template::instance()->render("kpi-dashboard/partials/_planning_table.html");
    }

    /**
     * @route("GET /admin/kpi/dashboard")
     */
    function kpi_dashboad_admin($f3)
    {
        $f3->now = (new DateTimeImmutable())->format('Y-W');
        $f3->now_iso = (new DateTimeImmutable())->format('Y-\WW');
        $f3->set('filter_pret', isset($f3->GET['pret']) ? true : false);

        // Pagination 
        $limit = 15;
        $produits_pret = (bool)isset($f3->GET['pret']);
        $f3->filter_pret = $produits_pret ? true : false;
        $filter = $produits_pret ? null : ['prete = ?', 0];
        $pagination = VuePlanningModel::paginate_all(0, $limit, $filter);
        $f3->pages = range(1, $pagination['count']);
        $f3->pos = $pagination['pos'] + 1;
        $f3->limit = $pagination['limit'];
        $produits = $pagination['subset'];
        $f3->set('produits', $produits);


        // Init Form Ajout 
        $f3->types = ProdTypeSousEnsembleModel::find_type(['Alternateur', 'Compresseur']); // Recup différent type
        $type = ProdTypeSousEnsembleModel::find_by_designation('Alternateur'); // recup id type depuis sa désignation 
        $fk_articles = ProdGroupeSousEnsembleModel::get_refs_by_type($type); //Recup tt les id des refs depuis le groupe type 

        // Construction des refs depuis l'ensemble des id ref 
        $refs = [];
        foreach ($fk_articles as $fk_article) {
            $refs[] = [
                '_id' => $fk_article->_id,
                'reference' => ProdArticlesModel::get_by_id($fk_article->_id)->reference
            ];
        }
        $f3->refs = $refs;


        echo \Template::instance()->render("kpi-dashboard/kpi_dashboard_admin.html");
    }

    /**
     * @route("GET /planning/@limit/@page")
     */
    function paginated_planning($f3, $params)
    {
        $f3->now = (new DateTimeImmutable())->format('Y-W');
        $f3->now_iso = (new DateTimeImmutable())->format('Y-\WW');


        $page = (int)$params['page'] - 1;
        $limit = (int) $params['limit'];

        $produits_pret = (bool)isset($f3->GET['pret']);
        $f3->filter_pret = $produits_pret ? true : false;
        $filter = $produits_pret ? null : ['prete = ?', 0];
        $pagination = VuePlanningModel::paginate_all($page, $limit, $filter);
        $f3->pages = range(1, $pagination['count']);
        $f3->pos = $pagination['pos'] + 1;
        $f3->limit = $pagination['limit'];
        $f3->produits = $pagination['subset'];

        echo \Template::instance()->render("kpi-dashboard/partials/_planning_table.html");
    }
}
