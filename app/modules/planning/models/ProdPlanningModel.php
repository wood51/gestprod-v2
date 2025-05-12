<?php
class ProdPlanningModel extends DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'prod_planning';

    public static function add($data) {
        $mapper = new self();
        $mapper->fk_article = $data['reference'];
        $mapper->fk_type_sous_ensemble = $data['type'];
        $mapper->semaine =$data['semaine'];
        $obj = $mapper->insert();
        return $obj->_id;
    }
}
