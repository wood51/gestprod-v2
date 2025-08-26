<?php
class AccidentsTravailModel extends \DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'securite_accidents_travail';

    public static function all($add_sans_arret = true)
    {
        $accidents = new self();
        $filtre = ($add_sans_arret) ? [""] : ["arret > 0"];
        $all = $accidents->afind($filtre, ['order' => 'date ASC']);
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
                'arret > 0 and YEAR(`date`) = ? and MONTH(`date`) = ?',
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
        $last = $accident->findone(['arret = 1'], ['order' => 'date DESC']); // on considère chaque accidentmême sans arrêt

       return ($last) ? $last['date'] : null;
    }
}
