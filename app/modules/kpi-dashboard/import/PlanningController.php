<?php
class PlanningController extends BaseController
{

    /**
     * @route("GET /planning/@livree")
     */
    function allPlanning($f3, $params)
    {
        $planning = new \DB\SQL\Mapper($this->db, 'vue_planning');
        $livree = $params["livree"];
        $query = $livree ?   $planning->find() : $planning->find("livree is null");
        echo json_encode(array_map([$planning, 'cast'], $query), JSON_PRETTY_PRINT);
    }


    /**
     * @route("GET /admin/engagement/add/@id/@semaine")
     */
    function addEngagement($f3, $params)
    {
        try {
            $id = $this->validation->validate($params['id'], 'int');

            $now = new DateTime();
            $semaine = $now->format("Y-W");

            $planning = new \DB\SQL\Mapper($this->db, "planning");
            $planning->load(['id = ?', $id]);
            if ($planning->dry()) {
                throw new \InvalidArgumentException("L'article n'existe pas");
            }

            $planning->engagement = $semaine;
            $planning->update();

            echo json_encode($planning->cast(), JSON_PRETTY_PRINT);
        } catch (\InvalidArgumentException $e) {
            $f3->error(400, $e->getMessage());
        } catch (\Exception $e) {
            $f3->error(500, "Erreur interne : " . $e->getMessage());
        }            
    }


    /**
     * @route("GET /planning/@startWeek/@endWeek/@livree")
     * TODO Modif semaine new format YYYY-WW 
     */
    function filteredPlanning($f3, $params)
    {
        $startWeek = explode("W", $params["startWeek"])[1];
        $endWeek =  explode("W", $params["endWeek"])[1];
        $livree = $params["livree"];

        $filter =  boolval($livree) ?  "(semaine BETWEEN ? and ?)" : "(livree IS NULL) AND (semaine BETWEEN ? AND ?)";

        $planning = new \DB\SQL\Mapper($this->db, 'vue_planning');
        $result = $planning->find([$filter, $startWeek, $endWeek]);
        echo json_encode(array_map([$planning, 'cast'], $result), JSON_PRETTY_PRINT);
    }
}
