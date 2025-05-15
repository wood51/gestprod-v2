<?php
class VueEngagementModel extends \DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'vue_engagements_synthese';

    public static function get_engagement_by_week($week) {
        $mapper = new self();
        $results = $mapper->find(['semaine_engagee = ?', $week]);
        return $results;
    }
    
}
