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
        return [
            'pages' => range(1, $pagination['count']),
            'pos' => $pagination['pos'],
            'limit' => $pagination['limit'],
            'produits' => $pagination['subset']
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

        $fk_articles = ProdGroupeSousEnsembleModel::get_refs_by_type($typeId);

        $refs = [];

        foreach ($fk_articles as $fk_article) {
            $refs[] = [
                '_id' => $fk_article->_id,
                'reference' => ProdArticlesModel::get_by_id($fk_article->_id)->reference
            ];
        }

        return ['refs' => $refs];
    }
}
