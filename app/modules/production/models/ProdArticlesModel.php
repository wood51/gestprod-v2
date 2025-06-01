<?php

class ProdArticlesModel extends DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'prod_articles';

    protected static function mapper(): self
    {
        return new self();
    }

    public static function all()
    {
        $result = self::mapper()->find(null, ['order' => 'reference ASC']);
        return $result;
    }

    public static function get_by_id(int $id)
    {
        return self::mapper()->findone(['id = ?', $id]);
    }

    public static function get_refs_by_type(int $type)
    {
        return self::mapper()->find(['fk_type_sous_ensemble = ?', $type]);
    }
}
