<?php
class ChartHelper {
    public static function getPreviousWeeks($semaine, $nbSemaines)
    {
        $weeks = [];
        $annee_number = explode("-", $semaine)[0];
        $semaine_number = explode("-", $semaine)[1];
        for ($i = 0; $i < $nbSemaines; $i++) {
            $date = (new DateTime())->setISODate($annee_number, $semaine_number - $i);
            $weeks[] = $date->format('Y-W'); // Format "2024-50"
        }
        return array_reverse($weeks); // On inverse pour avoir les semaines dans l'ordre
    }
}