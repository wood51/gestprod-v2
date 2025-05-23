<?php
class EngagementChartService {
    public function get_data($week) {
        $results = VueEngagementModel::get_engagement_by_week($week->full_week);
        $total_engagee = 0;
        $total_ponderee = 0;
        $annotations = [];
        $data = [
            [
                'name' => 'Réalisés',
                'data' => []
            ],
        ];
        if ($results) {
            foreach ($results as $result) {
                $total_engagee += $result->engagement;
                $total_ponderee += $result->engagement * $result->coefficient;
                $produit = floatval($result->produit ?? 0);
                $prete = $produit > 0 ? $produit : 0.05;

                $data[0]['data'][] = [
                    'x' => $result->reference,
                    'y' => $prete,
                    'fillColor' => $result->couleur,
                    'goals' => [[

                        'name' => 'Objectif',
                        'value' => $result->engagement,
                        'strokeHeight' => 3,
                        'strokeDashArray' => 5,
                        'strokeColor' => '#775DD0'

                    ]]
                ];


                if ($prete < $result->engagement) {
                    $annotations[] = [
                        'x' => $result->reference, // Position sur l'axe x (le label de la barre)
                        'y' => $result->engagement, // Position sur l'axe y (valeur de l'objectif)
                        'marker' => [
                            'size' => 0,
                            'fillColor' => '#775DD0',
                        ],
                        'label' => [
                            'text' => "$result->engagement",
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
        }

        $options = [
            "series" => $data,
            "title" => [
                "text" => $results 
                    ? "Engagement semaine $week->week - $total_engagee produits"
                    : "Aucun engagement trouvé pour la semaine $week->week"
            ],
            "annotations" => [
                "points" => $annotations
            ]
        ];

        if ($results) {
            $options["barWidth"] = intVal(100 / count($results)) . "%";
        }

        return $options;

    }

    // function test($f3)
    // {
    //     $mapper = new \DB\Cortex($f3->DB, 'vue_engagements_synthese');
    //     $engagement = 0;
    //     $produit = 0;
    //     $engagement_pondere = 0;
    //     $produit_pondere = 0;
    //     $results = $mapper->afind(['semaine_engagee = ?', '2024-50']);
    //     echo "Test Engagements<br>";

    //     foreach ($results as $result) {
    //         // Vue Ref ; Produite ; Engagée
    //         echo $result['reference'] . " (coeff=" . $result['coefficient'] . ") : " . $result['produit'] . "/" . $result['engagement'] . "<br>";

    //         // Calcul des totaux
    //         $engagement += $result['engagement'];
    //         $produit += $result['produit'];

    //         // Calcul totaux pondérée 
    //         $engagement_pondere += $result['engagement'] * $result['coefficient'];
    //         $produit_pondere += $result['produit'] * $result['coefficient'];
    //     }

    //     // taux de service global brut
    //     $ts_brut = round($produit / $engagement, 2) * 100;
    //     $ts_brut_pondere = round($produit_pondere / $engagement_pondere, 2) * 100;
    //     echo "Nb machines produite: $produit/$engagement <br>";
    //     echo "Nb machines produite (pondérés) $produit_pondere/$engagement_pondere<br>";
    //     echo "taux de service brut :" . strval($ts_brut) . "%<br>";
    //     echo "taux de service brut(pondéré) :" . strval($ts_brut_pondere) . "%<br>";
    // }
}