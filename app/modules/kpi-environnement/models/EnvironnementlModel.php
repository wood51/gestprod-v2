<?php
class EnvironnementlModel extends \DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'environnement_incidents';

        public static function all()
    {
        $accidents = new self();
        $all = $accidents->afind(null, ['order' => 'date ASC']);
        return $all;
    }

    public static function find_by_date($date)
    {
        $accident = new self();
        $findone = $accident->findone(['date = ?', $date]);
        return ($findone) ? $findone->cast() : [];
    }

    public static function accidents($annee, $mois)
    {
        $accidents = new self();
        $joursAT = [];

        $liste = $accidents->afind(
            [
                'YEAR(`date`) = ? and MONTH(`date`) = ?',
                $annee,
                $mois
            ]
        );

        $joursAT = [];

        if (is_array($liste)) {
            $joursAT = array_map(
                fn($date) => (int)date('j', strtotime($date)),
                array_column($liste, 'date')
            );
        }

        return $joursAT;
    }

    public static function last_accident()
    {
        $accident = new self();
        $last = $accident->findone(null, ['order' => 'date DESC']); // on considère chaque accidentmême sans arrêt

       return ($last) ? $last['date'] : null;
    }

}