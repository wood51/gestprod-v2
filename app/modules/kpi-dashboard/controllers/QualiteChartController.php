<?php
class QualiteChartController
{
    protected  $service;
    
    public function __construct()
    {
        $this->service = new QualiteChartService();
    }

    /**
     * @route("GET /defauts/@semaine")
     */
    public function defautControles($f3, $params)
    {
        try {
            $semaine = $params['semaine'];
            $results = $this->service->calculDefauts($semaine);

            $f3->set('HEADER.Content-Type', 'application/json');
            echo json_encode($results);
        } catch (\Exception $e) {
            $f3->error(500, "Erreur lors de la récupération des défauts: " . $e->getMessage());
        }
    }

    /**
     * @route("GET /defauts/historique/@semaine/@nb_semaines")
     */
    public function historiqueDefauts($f3, $params)
    {
        try {
            $semaine = $params['semaine'];
            $nb_semaines = $params['nb_semaines'] ?? 4;

            $series = [
                [
                    "name" => "Défauts Majeurs",
                    "color" => "#Ff0000",
                    "data" => []
                ],
                [
                    "name" => "Défauts Mineurs",
                    "color" => "#FBBF24",
                    "data" => []
                ],
                [
                    "name" => "Sans défauts",
                    "color" => "#34D399",
                    "data" => []
                ],
            ];

            $weeks = ChartHelper::getPreviousWeeks($semaine, $nb_semaines);

            foreach ($weeks as $week) {
                [$year, $weekNumber] = explode('-', $week);

                $results = $this->service->calculDefauts("$year-$weekNumber");

                $series[0]["data"][] = [
                    "x" => "$year-$weekNumber",
                    "y" => $results["majeurs"]
                ];

                $series[1]["data"][] = [
                    "x" => "Sem. $weekNumber",
                    "y" => $results["mineurs"]
                ];

                $series[2]["data"][] = [
                    "x" => "Sem. $weekNumber",
                    "y" => $results["no_defaut"]
                ];
            }

            $f3->set('HEADER.Content-Type', 'application/json');
            echo json_encode($series, JSON_PRETTY_PRINT);
        } catch (\Exception $e) {
            $f3->error(500, "Erreur lors de la récupération de l'historique des défauts: " . $e->getMessage());
        }
    }
}
