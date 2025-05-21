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

    public static function getHeuresTheoriquesSemaine($semaine, $annee, $heuresJour = 7)
    {
        $start = new DateTimeImmutable();
        $start = $start->setISODate($annee, $semaine)->setTime(0, 0);
        $end = $start->modify('+6 days');

        $joursOuvres = [];
        $current = $start;
        while ($current <= $end) {
            if ((int)$current->format('N') <= 5) { // lundi à vendredi
                $joursOuvres[] = $current;
            }
            $current = $current->modify('+1 day');
        }

        $fermetures = self::all();

        $joursTravailles = array_filter($joursOuvres, function ($jour) use ($fermetures) {
            foreach ($fermetures as $periode) {
                if ($jour >= $periode['debut'] && $jour <= $periode['fin']) {
                    return false;
                }
            }
            return true;
        });

        return count($joursTravailles) * $heuresJour;
    }
}
