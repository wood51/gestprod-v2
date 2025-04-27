<?php
class ConfigFermeturesModel extends DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'config_fermetures';

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
