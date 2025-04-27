<?php
class AccidentsTravailModel extends \DB\Cortex
{
    protected
        $db = 'DB',
        $table = 'accidents_travail';

    public static function all($add_sans_arret = false) {
        $accidents = new self();
        $filtre = ($add_sans_arret) ? [""] : ["arret > 0"];
        $all = $accidents ->afind($filtre, ['order' => 'date ASC']);
        return $all;
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
        $last = $accident->findone(['arret > 0'], ['order' => 'date DESC'])['date'];

        return $last ?? null;
    }
}
