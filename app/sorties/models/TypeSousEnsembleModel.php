<?php

class TypeSousEnsembleModel extends \DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'type_sous_ensemble',
        $fieldConf = [
            'designation' => [
                'type' => 'varchar(255)',
                'has-many' => ['SortieModel','fk_type_sous_ensemble'],
            ]
        ];
}