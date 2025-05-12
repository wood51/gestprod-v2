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
}
