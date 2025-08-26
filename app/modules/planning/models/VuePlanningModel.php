<?php

use DB\CortexCollection;

class VuePlanningModel extends DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'vue_prod_planning',
        $primary = "id";

    protected static function mapper()
    {
        return new self();
    }

    public static function all()
    {
        return self::mapper()->find();
    }

    public static function paginate_all($pos = 0, $size = 10, $filter = null,$option=null)
    {
        return self::mapper()->paginate($pos, $size, $filter, $option);
    }


    public static function findById($planningId) {
        return self::mapper()->findone(['id=?',$planningId]);
    }

    public static function get_filters(array|string $columns, array $query_filter = []): array
    {
        $cols = is_string($columns) ? explode(',', $columns) : $columns;
        $results = self::mapper()->find($query_filter);

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
