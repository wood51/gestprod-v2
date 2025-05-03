<?php
class EngagementChartController
{
    protected $service;
    public function __construct()
    {
        $this->service = new EngagementChartService();
    }
    
    

    /**
     * @route("GET /kpi/engagement/@semaine")
     */
    function engagement($f3, $params)
    {
        $week =  DateHelper::extract_week_year($params['semaine']);

        $chart_options = $this->service->get_data($week);
        header('Content-Type: application/json');
        echo json_encode($chart_options, JSON_PRETTY_PRINT);
        http_response_code(200);
        exit();
    }
}
