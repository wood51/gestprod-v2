<?php
class SuivisOperationModel extends DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'suivis_operations',
        $primary = 'id';

    public static function all()
    {
        $mapper = new self();
        $operations = $mapper->find();

        return ($operations) ? $operations : null;
    }
}
