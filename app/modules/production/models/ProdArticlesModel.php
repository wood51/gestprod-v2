<?php

class ProdArticlesModel extends DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'prod_articles';
        
    public static function all()
    {
        $mapper = new self();
        $result = $mapper->find(null,['order'=>'reference ASC']);
        return $result;
    }

    public static function get_by_id(int $id) {
        $mapper = new self();
        return $mapper->findone(['id = ?',$id]);
    }

    /**
     * Retourne toutes les fk_article par type 
     */
    public static function get_refs_by_type(int $type)
    {
        $mapper = new self();
        return $mapper->find(['fk_type_sous_ensemble = ?', $type]);
    }

}