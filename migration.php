<?php
// migration_engagements.php
require 'vendor/autoload.php';

$f3 = \Base::instance();

// Configuration source et destination
$f3->set('DB_OLD', new DB\SQL('mysql:host=localhost;port=3306;dbname=f3-tv', 'root', 'Bd135@c127'));
$f3->set('DB_NEW', new DB\SQL('mysql:host=localhost;port=3306;dbname=gestprod_v2', 'root', 'Bd135@c127'));

$src = $f3->get('DB_OLD');
$dst = $f3->get('DB_NEW');

$logFile = __DIR__ . '/log.txt';
file_put_contents($logFile, "--- Début de la migration ---\n");

$rows = $src->exec("SELECT * FROM planning ORDER BY id");

foreach ($rows as $row) {
    // 1. Insérer dans nouvelle table `prod_planning` AVEC id conservé
    $dst->exec(
        "INSERT INTO prod_planning (id, fk_article, numero, fk_type_sous_ensemble, fk_etat, commentaire, prete, livree, semaine, engagement)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [
            $row['id'],
            $row['fk_article'],
            $row['numero'],
            $row['fk_type_article'], // correspond à fk_type_sous_ensemble maintenant
            $row['fk_etat'],
            $row['commentaire'],
            $row['prete'],
            $row['livree'],
            $row['semaine'],
            $row['engagement']
        ]
    );

    $newPlanningId = $row['id'];

    $semaine = $row['semaine'];
    $engagement = $row['engagement'];
    $hasNumero = !empty($row['numero']);
    $typeArticle = $row['fk_type_article'];

    $logEntry = "Planning ID {$newPlanningId} (ancien ID {$row['id']}) : ";

    // Cas 1 : Machine prévue mais pas encore faite (pas de numero, sauf si type_article = 7)
    if (!$hasNumero && $typeArticle != 7) {
        $dst->exec(
            "INSERT INTO prod_engagements (fk_planning, semaine_engagee, etat, commentaire)
             VALUES (?, ?, 'prévu', 'Import : prévu sans numéro')",
            [$newPlanningId, $engagement]
        );
        file_put_contents($logFile, $logEntry . "prévu ({$engagement})\n", FILE_APPEND);
        continue;
    }

    // Cas 2 : Machine reportée (engagement > semaine)
    if ($engagement > $semaine) {
        $dst->exec(
            "INSERT INTO prod_engagements (fk_planning, semaine_engagee, etat, commentaire)
             VALUES (?, ?, 'reporté', 'Import : initialement prévu')",
            [$newPlanningId, $semaine]
        );

        $dst->exec(
            "INSERT INTO prod_engagements (fk_planning, semaine_engagee, etat, commentaire)
             VALUES (?, ?, 'fait', 'Import : réalisé après report')",
            [$newPlanningId, $engagement]
        );

        file_put_contents($logFile, $logEntry . "reporté ({$semaine}) + fait ({$engagement})\n", FILE_APPEND);
        continue;
    }

    // Cas 3 : Machine faite normalement (semaine = engagement)
    $dst->exec(
        "INSERT INTO prod_engagements (fk_planning, semaine_engagee, etat, commentaire)
         VALUES (?, ?, 'fait', 'Import : réalisé normalement')",
        [$newPlanningId, $engagement]
    );
    file_put_contents($logFile, $logEntry . "fait ({$engagement})\n", FILE_APPEND);
}

// Synchroniser l'AUTO_INCREMENT sur les deux tables
$maxPlanningId = $dst->exec("SELECT MAX(id) AS max_id FROM prod_planning");
$nextId = (int)$maxPlanningId[0]['max_id'] + 1;
$dst->exec("ALTER TABLE prod_planning AUTO_INCREMENT = {$nextId}");
$dst->exec("ALTER TABLE prod_engagements AUTO_INCREMENT = {$nextId}");

file_put_contents($logFile, "--- Fin de la migration ---\n", FILE_APPEND);
