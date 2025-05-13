<?php
class PerformanceChartController
{
    protected $service;

    public function __construct()
    {
        $this->service = new PerformanceChartService();
    }


    /**
     * @route("GET /performance/@semaine")
     */
    public function performanceActuel($f3, $params)
    {
        try {
            $semaine = $params['semaine'];

            $f3->set('HEADER.Content-Type', 'application/json');
            echo json_encode(["performance" => $this->service->calculPerformance($semaine)]);
        } catch (\Exception $e) {
            $f3->error(500, "Erreur lors du calcul de la performance actuelle: " . $e->getMessage());
        }
    }

    /**
     * @route("GET /performance-mois/@semaine/@nb_semaines")
     */
    public function performanceMois($f3, $params)
    {
        try {
            $semaine = $params['semaine'];
            $nb_semaines = $params['nb_semaines'];

            $serie = [
                "name" => "Performance",
                "color" => "#4338ca",
                "data" => []
            ];

            $weeks = ChartHelper::getPreviousWeeks($semaine, $nb_semaines);

            foreach ($weeks as $week) {
                [$year, $weekNumber] = explode('-', $week);
                $performance = $this->service->calculPerformance($week) / 100;

                $serie["data"][] = [
                    "x" => "$year/$weekNumber",
                    "y" => $performance
                ];
            }

            $f3->set('HEADER.Content-Type', 'application/json');
            echo json_encode($serie, JSON_PRETTY_PRINT);
        } catch (\Exception $e) {
            $f3->error(500, "Erreur lors du calcul de la performance du mois: " . $e->getMessage());
        }
    }

    
}
