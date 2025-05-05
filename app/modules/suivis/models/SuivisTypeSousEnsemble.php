<?php
class SuivisTypeSousEnsemble extends \DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'prod_type_sous_ensemble';

        public static function all() {
            $mapper = new self();
            $result = $mapper->find();
            return $result;
        }
}
