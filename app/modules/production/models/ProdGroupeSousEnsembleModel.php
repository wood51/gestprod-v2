<?php
class ProdGroupeSousEnsembleModel extends DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'prod_groupe_sous_ensemble';

    /**
     * Retourne toutes les fk_article par type 
     */
    public static function get_refs_by_type(int $type)
    {
        $mapper = new self();
        return $mapper->find(['fk_type_sous_ensemble = ?', $type]);
    }
}
