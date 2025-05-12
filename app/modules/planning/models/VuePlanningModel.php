<?php

use DB\CortexCollection;

class VuePlanningModel extends DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'vue_prod_planning',
        $primary = "id";


    public static function all(): bool|CortexCollection
    {
        $mapper = new self();
        return $mapper->find();
    }

    public static function paginate_all($pos=0, $size=10, $filter=null)
    {
        $mapper = new self();
        return $mapper->paginate($pos,$size,$filter,['order'=>'id DESC']);
    }




    public static function get_filters(array|string $columns, array $query_filter = []): array
    {
        $mapper = new self();

        $cols = is_string($columns) ? explode(',', $columns) : $columns;
        $results = $mapper->find($query_filter);

        if ($results) {
            $filtres = [];
            $tmp = [];
            foreach ($cols as $col) {

                foreach ($results as $result) {

                    if (!isset($result->$col)) continue;
                    $tmp[$col][$result->$col] = true;
                }

                $filtres[$col] = array_keys($tmp[$col]);
                asort($filtres[$col]);
            }

            return $filtres;
        }

        return [];
    }
}
