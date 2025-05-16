<?php

/**
 * Class DateHelper
 *
 * Fournit des outils pour gérer les dates dans l'application.
 */
class DateHelper
{
    /**
     * Récupère le nom complet du mois pour une année et un mois donnés.
     *
     * @param int $annee Année au format 4 chiffres (ex: 2025).
     * @param int $mois Mois numérique (1-12).
     * @param string $lang Langue locale pour le formatage (par défaut 'fr_FR').
     * @return string Le nom du mois formaté (ex: 'avril').
     */
    public static function get_month_name($annee, $mois, $lang = 'fr_FR')
    {
        $formatter = new \IntlDateFormatter(
            $lang,
            \IntlDateFormatter::LONG,
            \IntlDateFormatter::NONE,
            null,
            \IntlDateFormatter::GREGORIAN,
            'LLLL'
        );

        $date = new DateTimeImmutable("$annee-$mois-01");

        return $formatter->format($date);
    }

    /**
     * Récupère les jours fériés du mois spécifié.
     *
     * @param int $annee Année au format 4 chiffres.
     * @param int $mois Mois numérique (1-12).
     * @return array Liste des jours fériés du mois sous forme de dates 'YYYY-MM-DD'.
     */
    public static function get_ferries($annee, $mois)
    {
        $feries = json_decode(
            file_get_contents('https://calendrier.api.gouv.fr/jours-feries/metropole.json'),
            true
        );

        $feries_mois = array_filter(array_keys($feries), function ($date) use ($annee, $mois) {
            return str_starts_with($date, sprintf('%04d-%02d', $annee, $mois));
        });

        return $feries_mois;
    }

    /**
     * Construit un objet contenant toutes les informations importantes pour manipuler un mois donné.
     *
     * - Si $annee et $mois sont fournis ➔ construit le mois donné.
     * - Sinon ➔ construit sur la date actuelle.
     *
     * @param int|null $annee Année au format 4 chiffres. Null pour l'année actuelle.
     * @param int|null $mois Mois numérique (1-12). Null pour le mois actuel.
     * @return object
     *      - datetime: DateTimeImmutable de contexte (mois affiché).
     *      - annee: Année (int).
     *      - mois: Mois (int).
     *      - jour: Jour du mois (int).
     *      - semaine: Numéro de semaine ISO (int).
     *      - aujourdhui: Date du jour réel (string 'YYYY-MM-DD').
     *      - premier_jour_mois: DateTimeImmutable sur le 1er jour du mois.
     *      - nb_jours_mois: Nombre de jours dans le mois (28-31).
     *      - first_day_of_month: Jour de la semaine du 1er du mois (1=lundi, 7=dimanche).
     */
    public static function build($annee = null, $mois = null)
    {
        $time_str = ($annee &&  $mois) ? "$annee-$mois-01" : "";
        $instant = new DateTimeImmutable($time_str);

        return (object) [
            'datetime' => $instant,
            'annee' => (int)$instant->format('Y'),
            'mois' => (int)$instant->format('n'),
            'jour' => (int)$instant->format('j'),
            'semaine' => (int)$instant->format('W'),
            'aujourdhui' => (new DateTimeImmutable(''))->format('Y-m-d'),
            'premier_jour_mois' => new DateTimeImmutable($instant->format('Y-m-01')),
            'nb_jours_mois' => (int) $instant->format('t'),
            'first_day_of_month' => (int) (new DateTimeImmutable($instant->format('Y-m-01')))->format('N')
        ];
    }

    public static function extract_week_year($semaine)
    {
        [$year, $week] = explode("-", $semaine);
        return (object) [
            'full_week' => $semaine,
            'week' => $week,
            'year' => $year
        ];
    }

    public static function get_week_year() {
        $now = new DateTimeImmutable();
        return $now->format('Y-W');
    }
}
