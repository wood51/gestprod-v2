<?php
class SortieModel extends \DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'sorties',
        $fieldConf = [
            'fk_article_id' =>
            [
                'type' => 'int',
                'belongs-to-one' => '\ArticleModel'
            ],
            'fk_type_sous_ensemble' =>
            [
                'type' => 'int',
                'belongs-to-one' => '\TypeSousEnsembleModel',
            ]
        ];

    public function getSorties($f3) {}
}
