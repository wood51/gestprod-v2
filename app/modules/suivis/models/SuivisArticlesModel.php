<?php

class SuivisArticlesModel extends DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'prod_articles';
        
    public static function all()
    {
        $mapper = new self();
        $result = $mapper->find();
        return $result;
    }
}
