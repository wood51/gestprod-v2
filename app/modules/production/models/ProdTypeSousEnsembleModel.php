<?php
class ProdTypeSousEnsembleModel extends \DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'prod_type_sous_ensemble';

    public static function all()
    {
        $mapper = new self();
        $result = $mapper->find();
        return $result;
    }
    
    /**
     * Retourne un type depuis sa désignation
     */
    public static function find_by_designation(string $type) {
        $mapper = new self();
        return $mapper->findone(['designation = ? ',$type])->id;
    }

    /**
     * Retourne plusieurs fk_type_sous_ensemble depuis un string ou array
     */
    public static function find_type(string|array $types = [])
    {
        $mapper = new self();

        if (!empty($types)) {
            $types = is_array($types) ? $types : explode(',', $types);
            $placeholders = implode(',', array_fill(0, count($types), '?'));
            $query = "designation IN ($placeholders)";
            return $mapper->find([$query, $types]); 
        }

        return $mapper->find();
    }
}
