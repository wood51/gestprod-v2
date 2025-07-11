<?php
class FilterHelper
{

    public static function getFilter()
    {
        $cache = \Cache::instance();
        $key = 'filter_' . session_id();
        if ($cache->exists($key)) {
            return $cache->get($key);
        } else {
            self::resetFilter();
            return $cache->get($key);
        }
    }

    public static function setFilter($value)
    {
        $cache = \Cache::instance();
        $cache->set('filter_' . session_id(), $value);
    }

    public static function resetFilter()
    {
        $default = ['filter' => null, 'option' => null];
        self::setFilter($default);
    }

    public static function makeFilter($col, $formData)
    {

        $oldFilter = FilterHelper::getFilter();
        $count = count($formData);
        $vals = array_values($formData);

        if ($count > 1) {
            $in =  implode(',', array_fill(0, $count, "?"));
            $filter['filter'] = ["$col IN ($in)", ...$vals];
        } elseif ($count === 1) {
            $filter['filter'] = ["$col = ?", ...$vals];
        } else {
            $filter['filter'] = [];
        }


        $filter['option'] = $oldFilter['option'];
        FilterHelper::setFilter($filter);
    }

    public static function makeSort($col, $sort)
    {
        $oldFilter = FilterHelper::getFilter();
        $filter['filter'] = $oldFilter['filter'];
        $filter['option'] = ["order" => "$col $sort"];
        self::setFilter($filter);
        // self::setFilter(
        //     [
        //         'filter' =>$filter['filter'],
        //         'option' => ["order" => "$col $sort"]
        //     ]
        //);
    }

    public static function get_filters(string $table,array|string $columns, array $query_filter = [])
    {
        $mapper = new DB\Cortex(Base::instance()->DB,$table);
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
