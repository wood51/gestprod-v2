<?php
class ProdPlanningModel extends DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'prod_planning';

    public static function add($data)
    {
        $mapper = new self();
        $mapper->fk_article = $data['reference'];
        $mapper->fk_type_sous_ensemble = $data['type'];
        $mapper->semaine = $data['semaine'];
        $obj = $mapper->insert();
        return $obj->_id;
    }

    /**
     * Update le numéro de produit 
     */
    public static function updateNumero($planningId, $numero)
    {
        $mapper = new self();
        $mapper->load(['id = ?', $planningId]);
        if (!$mapper->dry()) {
            $mapper->numero = $numero;
            $mapper->update();
            return true;
        }
        return false;
    }

    public static function setPret($planningId)
    {
        $mapper = new self();
        $mapper->load(['id = ?', $planningId]);
        $mapper->prete = 1;
        return  $mapper->update();
    }

    public static function isNumeroUnique($planningId, $numero)
    {
        $planning = new self();
        $planning->load(['id = ?', $planningId]);
        $fk_article = $planning->fk_article;

        $check = new self();
        $check->load(['fk_article = ? AND numero = ?', $fk_article, $numero]);

        return $check->dry(); // true si non trouvé = unique
    }
}
