<?php
class ChartController extends BaseController
{
    private $vue_engagement, $presence, $planning, $controles, $vue_defauts, $gravite;

    public function __construct()
    {
        parent::__construct();
        $this->presence = new PresenceModel();
        $this->planning = new \DB\SQL\Mapper($this->db, 'planning');
        $this->vue_engagement = new \DB\SQL\Mapper($this->db, 'vue_engagement');
        $this->controles = new \DB\SQL\Mapper($this->db, 'controles');
        $this->vue_defauts = new \DB\SQL\Mapper($this->db, 'vue_defauts');
        $this->gravite = new \DB\SQL\Mapper($this->db, 'gravite_defaut');
    }

    public function beforeRoute($f3) 
    {
        $params = $f3->get('PARAMS');
        $semaine = isset($params['semaine']) ?  $params['semaine'] : null;
        
        if ($semaine !== null ) {
            $this->validateSemaine($semaine);
        }
    }

    private function validateSemaine($semaine)
    {
        if (!preg_match('/^\d{4}-\d{2}$/', $semaine)) {
            throw new \Exception("Format semaine invalide : $semaine");
        }
    }

    private function getPreviousWeeks( $semaine, $nbSemaines)
    {
        $weeks = [];
        $annee_number = explode("-",$semaine)[0];
        $semaine_number = explode("-",$semaine)[1];
        for ($i = 0; $i < $nbSemaines; $i++) {
            $date = (new DateTime())->setISODate($annee_number, $semaine_number - $i);
            $weeks[] = $date->format('Y-W'); // Format "2024-50"
        }
        return array_reverse($weeks); // On inverse pour avoir les semaines dans l'ordre
    }


    // private function getNbMachinePretes($engagement)
    // {
    //     try {
    //         $vuePlanning = new \DB\SQL\Mapper($this->db,"vue_planning");
    //         $vuePlanning->nb_machines_ponderee= "sum(coefficient)";
    //         $vuePlanning->load(["engagement = ? and prete=1", "$engagement"]);
    //         return (!$vuePlanning->dry()) ? $vuePlanning->nb_machines_ponderee : 0;
    //     } catch (\Exception $e) {
    //         throw new \Exception("Erreur lors de la récupération des machines prêtes: " . $e->getMessage());
    //     }
    // }

    // Calcul sans coefficient 
    private function getNbMachinePretes($engagement)
    {
        try {
            $this->planning->nb_machines_pretes = "COUNT(id)";
            $this->planning->load(["engagement = ? and prete=1", "$engagement"]);
            return (!$this->planning->dry()) ? $this->planning->nb_machines_pretes : 0;
        } catch (\Exception $e) {
            throw new \Exception("Erreur lors de la récupération des machines prêtes: " . $e->getMessage());
        }
    }

    private function calculPerformance($semaine)
    {


        try {
            $annee_number = explode("-",$semaine)[0];
            $semaine_number = explode("-",$semaine)[1];
            $operateurs = $this->presence->getNbOperateursSemaine($semaine_number, $annee_number); // TODO MODIF PRESENCE POUR SEMAINE UNIQUE ?????????????
            $nb_machines_prete = $this->getNbMachinePretes($semaine);
            $objectif_production = $operateurs['total_operateurs'];
            $indice_performance = ($objectif_production) ? round(($nb_machines_prete / $objectif_production) * 100, 2) : 0;
            return $indice_performance;
        } catch (\Exception $e) {
            throw new \Exception("Erreur lors du calcul de la performance: " . $e->getMessage());
        }
    }

    private function calculDefauts($semaine)
    {
        try {
            [$annee_number,$semaine_number] = explode("-",$semaine);

            $sql = "SELECT 
                        COUNT(*) AS total_controles, 
                        SUM(CASE WHEN gravite IS NULL THEN 1 ELSE 0 END) AS no_defaut,
                        SUM(CASE WHEN gravite = 'mineur' THEN 1 ELSE 0 END) AS mineurs,
                        SUM(CASE WHEN gravite = 'majeur' THEN 1 ELSE 0 END) AS majeurs
                    FROM vue_defauts
                    WHERE WEEKOFYEAR(date_controle) = ? AND YEAR(date_controle) = ?";

            $result = $this->db->exec($sql, [$semaine_number, $annee_number]);
            $data = $result[0];

            $total_controles = $data['total_controles'];
            $mineurs = $data['mineurs'];
            $majeurs = $data['majeurs'];

            // Extraction des poids des défauts
            $poids = array_combine(
                array_column($this->gravite->find(), 'libelle'),
                array_column($this->gravite->find(), 'poids')
            );

            // Calcul de l'indice de qualité (IQ)
            if ($total_controles > 0) {
                $iq = (1 - (($majeurs * $poids['majeur'] + $mineurs * $poids['mineur']) / $total_controles)) * 100;
            } else {
                $iq = 100; // Si aucun contrôle, l'indice de qualité est parfait
            }

            $result = [
                "semaine" => $semaine_number,
                "nb_controles" =>  $total_controles,
                "no_defaut" => $data['no_defaut'],
                "mineurs" => $mineurs,
                "majeurs" => $majeurs,
                "iq" => $iq
            ];

            return $result;
        } catch (\Exception $e) {
            throw new \Exception("Erreur lors du calcul des défauts: " . $e->getMessage());
        }
    }

    // Méthode privée pour la première requête
    private function getTotalMachines($semaine)
    {
        $vue_engagement = new \DB\SQL\Mapper($this->db, 'vue_engagement');
        $vue_engagement->total = "SUM(engagement_total)";  // Définit le champ à récupérer
        return $vue_engagement->findOne(['engagement=?', "$semaine"])['total'];
    }

    private function getTotalMachinesPonderee($semaine)
    {
        $vuePlanning = new \DB\SQL\Mapper($this->db,"vue_planning");
        $vuePlanning->nb_machines_ponderee= "sum(coefficient)";
        $vuePlanning->load(["engagement = ?", "$semaine"]);
        return (!$vuePlanning->dry()) ? $vuePlanning->nb_machines_ponderee : 0;
    }

    /**
     * @route("GET /engagement/@semaine")
     */
    public function engagement($f3, $params)
    {
        try {
            $semaine = $params['semaine'];
            $semaineNumber = explode("-", $semaine)[1]; // recup no semaine format YYYY-WW

            $total_articles = $this->getTotalMachines($semaine);
            //$total_pondere = round($this->getTotalMachinesPonderee($semaine),1);

            $data = [
                [
                    'name' => 'Réalisés',
                    'data' => []
                ],
            ];

            $annotations = [];

            $this->vue_engagement->total = null;
            $result = $this->vue_engagement->find(['engagement=?', "$semaine"]);

            foreach ($result as $r) {
                $article = $r->article;
                $couleur = $r->couleur;
                $engagement_total = $r->engagement_total;

                $prete = isset($r->prete_total) ? max(floatval($r->prete_total), 0.05) : 0;

                $data[0]['data'][] = [
                    'x' => $article,
                    'y' => $prete,
                    'fillColor' => $couleur,
                    'goals' => [[

                        'name' => 'Objectif',
                        'value' => $engagement_total,
                        'strokeHeight' => 5,
                        'strokeDashArray' => 5,
                        'strokeColor' => '#775DD0'

                    ]]
                ];

                // Ajouter une annotation pour l'objectif
                if ($prete < $engagement_total) {
                    $annotations[] = [
                        'x' => $article, // Position sur l'axe x (le label de la barre)
                        'y' => $engagement_total, // Position sur l'axe y (valeur de l'objectif)
                        'marker' => [
                            'size' => 0,
                            'fillColor' => '#775DD0',
                        ],
                        'label' => [
                            'text' => "$engagement_total",
                            'style' => [
                                'color' => '#775DD0',
                                'background' => '#fff', // Fond blanc pour être bien visible
                                'fontSize' => '20px',
                                'fontWeight' => 'bold'
                            ],
                            'offsetY' => 0 // Ajuster pour ne pas chevaucher la barre
                        ]
                    ];
                }
            }

            $options = [
                "series" => ["data" => $data],
                "title" => ["text" => "Engagement semaine $semaineNumber - $total_articles produits"],
                //"title" => ["text" => "Engagement semaine $semaineNumber - $total_articles produits (équivalent $total_pondere)"],
                "barWidth" => intVal(100 / count($result)) . "%",
                "annotations" => [
                    "points" => $annotations
                ]
            ];


            $f3->set('HEADER.Content-Type', 'application/json');
            echo json_encode($options, JSON_PRETTY_PRINT);
        } catch (\Exception $e) {
            $f3->error(500, "Erreur lors de la récupération de l'engagement: " . $e->getMessage());
        }
    }


    /**
     * @route("GET /performance/@semaine")
     */
    public function performanceActuel($f3, $params)
    {
        try {
            $semaine = $params['semaine'];

            $f3->set('HEADER.Content-Type', 'application/json');
            echo json_encode(["performance" => $this->calculPerformance($semaine)]);
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
                "color" => "#6366f1",
                "data" => []
            ];

            $weeks = $this->getPreviousWeeks( $semaine, $nb_semaines);

            foreach ($weeks as $week) {
                [$year, $weekNumber] = explode('-', $week);
                $performance = $this->calculPerformance($week) / 100;

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


    /**
     * @route("GET /defauts/@semaine")
     */
    public function defautControles($f3, $params)
    {
        try {
            $semaine = $params['semaine'];
            $results = $this->calculDefauts($semaine);

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

            $weeks = $this->getPreviousWeeks( $semaine,$nb_semaines);

            foreach ($weeks as $week) {
                [$year, $weekNumber] = explode('-', $week);
                
                $results = $this->calculDefauts("$year-$weekNumber");

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

    /**
     * @route("GET /defaults/repartion/@semaine")
     */
    public function repartitionDefauts() {
        
    }
}
