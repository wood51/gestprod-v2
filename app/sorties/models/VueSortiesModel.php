<?php
class VueSortiesModel extends \DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'vue_sorties';

    public static function all()
    {
        $vue = new self();
        $rows = $vue->afind([], ['order' => 'date DESC']);
        return  $rows;
    }
}
