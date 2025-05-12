<?php
class ProdEngagementModel extends DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'prod_engagement';

    /**
     * Ajoute un engagement par défaut
     */
    public static function add($fk_planning, $semaine = null)
    {
        $mapper = new self();
        $mapper->fk_planning = $fk_planning;
        $mapper->semaine_engagee = $semaine;
        $obj = $mapper->insert();
        return $obj ? $obj->_id : null;
    }

    public static function getLastEngagement($planningId)
    {
        $mapper = new self();
        $last = $mapper->find(
            ['fk_planning = ?', $planningId],
            ['order' => 'modified_at DESC', 'limit' => 1]
        )[0] ?? null;

        return $last;
    }
}
