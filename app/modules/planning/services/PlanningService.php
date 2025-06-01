<?php

class PlanningService
{

    public function addProduit(array $data): int
    {
        return ProdPlanningModel::add($data);
    }

    /**
     * Retourne la semaine actuelle au format simple et ISO.
     */
    public  function getNowInfo(): array
    {
        $now = new DateTimeImmutable();
        return [
            'now' => $now->format('Y-W'),
            'now_iso' => $now->format('Y-\WW'),
        ];
    }

    /**
     * Paginer les machines du planning avec ou sans filtre "non prêtes".
     */
    public  function paginatePlanning(int $page, int $limit, bool $all = false): array
    {
        $filter = $all ? null : ['prete = ?', 0];
        $pagination =  VuePlanningModel::paginate_all($page, $limit, $filter);
        // $prev = max($pagination['pos']+1,1);
        // $next = min($pagination['pos']+2,$pagination['count']-1);
        $totalPages = $pagination['count'];
        $currentPage = $pagination['pos'] + 1; // remettre en page 1-indexée

        $prev = ($currentPage > 1) ? $currentPage - 1 : null;
        $next = ($currentPage < $totalPages) ? $currentPage + 1 : null;
        
        return [
            'pages' => range(1, $pagination['count']),
            'total' => $pagination['count'],
            'page' =>  $currentPage,
            'limit' => $pagination['limit'],
            'produits' => $pagination['subset'],
            'prev' => $prev,
            'next' => $next
        ];
    }

    /**
     * Récupère les types de sous-ensemble disponibles (ex: Alternateur).
     */
    public  function getAvailableTypes(array $designations = []): bool|\DB\CortexCollection
    {
        return ProdTypeSousEnsembleModel::find_type($designations);
    }

    /**
     * Récupère toutes les références disponibles pour un type donné.
     */
    public  function getRefsByType(int|string $type): array
    {
        if (is_string($type)) {
            $typeId =  ProdTypeSousEnsembleModel::find_by_designation($type);
        } else {
            $typeId = $type;
        }

        $fk_articles = (array) ProdArticlesModel::get_refs_by_type($typeId);
        $refs = [];

        foreach ($fk_articles as $fk_article) {
            $refs[] = [
                '_id' => $fk_article->_id,
                'reference' => ProdArticlesModel::get_by_id($fk_article->_id)->reference
            ];
        }

        return ['refs' => $refs];
    }

    public function renderPartialPlanning()
    {
        $f3 = Base::instance();
        // Recup etat session
        $filter_pret = isset($f3->SESSION['filter_pret']) ? $f3->SESSION['filter_pret'] : false;
        $page = isset($f3->SESSION['pagination_page']) ? $f3->SESSION['pagination_page'] : 0;
        $limit = isset($f3->SESSION['pagination_limit']) ? $f3->SESSION['pagination_limit'] : 15;

        // Init template 
        $f3->filter_pret = $filter_pret;
        $f3->mset($this->getNowInfo());
        $f3->mset($this->paginatePlanning($page, $limit, $filter_pret));

        echo \Template::instance()->render("planning/partials/_planning_table.html");
    }
}
