<?php
class AtelierFermeturesModel extends DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'atelier_fermetures';

    public static function all()
    {
        $mapper = new self();
        $fermetures = array_map(function ($periode) {
            return [
                'debut' => new DateTimeImmutable($periode['debut']),
                'fin' => new DateTimeImmutable($periode['fin'])
            ];
        }, $mapper->afind([], ['order' => 'debut ASC']));

        return $fermetures;
    }
}
