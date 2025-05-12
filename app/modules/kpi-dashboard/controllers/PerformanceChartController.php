<?php
class PerformanceChartController {
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
     * @route("GET /test/presence")
     */
    function test_presence() {
        $result  = PresenceModel::getNbOperateursSemaine(18, 2025, $heures_semaine = 35);
        echo var_dump($result);
        echo "<br>";
        echo var_dump(ProdEngagementModel::getNbMachinePretes("2025-18"));
        echo "<br>";
        echo var_dump($this->service->calculPerformance("2025-18"));
        echo "<br>";
    }

    
}