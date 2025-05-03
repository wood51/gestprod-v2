<?php
class AtelierOperationModel extends DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'atelier_operations',
        $primary = 'id';

    public static function all()
    {
        $mapper = new self();
        $operations = $mapper->find();

        return ($operations) ? $operations : null;
    }
}
