<?php
class EngagementTypeController
{

    /**
     * @route("GET /kpi/engagement-type/@week")
     */
    function engagementType($f3, $params)
    {
        $week = $params['week'];

        $db = $f3->get('DB');
        $rows = $db->exec("
            SELECT
                type_sous_ensemble,
                SUM(produit) as produit,
                SUM(engagement) as objectif,
                couleur
            FROM vue_engagements_synthese
            WHERE semaine_engagee = ?
            GROUP BY type_sous_ensemble
        ", [$week]);


        $series = ['data' => []];
        $annotations = ['points' => []];

        $totalRealise = 0;
        $totalObjectif = 0;

        foreach ($rows as $row) {
            $libelle = $row['type_sous_ensemble'];
            $realise = (int)$row['produit'];
            $objectif = (int)$row['objectif'];
            $couleur = $row['couleur'] ?? '#999';

            $series['data'][] = [
                'x' => $libelle,
                'y' => $realise,
                'fillColor' => $couleur,
                'goals' => [[
                    'name' => 'Objectif',
                    'value' => $objectif,
                    'strokeHeight' => 5,
                    'strokeColor' => '#775DD0',
                ]],
            ];

            $annotations['points'][] = [
                'x' => $libelle,
                'y' => $objectif,
                'marker' => ['size' => 0],
                'label' => [
                    'text' => $objectif,
                    'style' => [
                        'color' => '#775DD0',
                        'background' => '#fff',
                        'fontSize' => '20px',
                        'fontWeight' => 'bold'
                    ]
                ]
            ];

            $totalRealise += $realise;
            $totalObjectif += $objectif;
        }

        // Bloc "Total"
        $series['data'][] = [
            'x' => 'Total',
            'y' => $totalRealise,
            'fillColor' => '#36d399',
            'goals' => [[
                'name' => 'Objectif',
                'value' => $totalObjectif,
                'strokeHeight' => 5,
                'strokeColor' => '#775DD0',
            ]],
        ];
        $annotations['points'][] = [
            'x' => 'Total',
            'y' => $totalObjectif,
            'marker' => ['size' => 0],
            'label' => [
                'text' => $totalObjectif,
                'style' => [
                    'color' => '#775DD0',
                    'background' => '#fff',
                    'fontSize' => '20px',
                    'fontWeight' => 'bold'
                ]
            ]
        ];

        
        echo json_encode([
            'title' => [
                'text' => "Engagement Semaine {$week} - {$totalObjectif} Produits",
                'align' => 'center',
                'style' => [
                    'fontSize' => '22px',
                    'color' => '#4B4B4B',
                    'fontWeight' => 'bold'
                ]
            ],
            'series' => [$series],
            'annotations' => $annotations,
        ], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
    }
}
