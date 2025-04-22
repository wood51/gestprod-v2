<?php

class ArticleModel extends \DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'articles',
        $fieldConf = [
            'reference' => [
                'type' => 'varchar(255)',
                'has-many' => ['\SortieModel','fk_article_id'],
            ],
        ];
}
