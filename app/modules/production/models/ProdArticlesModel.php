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

}