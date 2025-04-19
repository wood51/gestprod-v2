<?php
class VueSortiesModel extends \DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'vue_sorties';

    public static function all()
    {
        $sorties = new self();
        $sorties->load(null, [
            'order' => 'date DESC'
        ]);
        if ($sorties->dry()) {
            return [];
        }
        return [$sorties->cast()];
    }
}
