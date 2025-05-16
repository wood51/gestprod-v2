<?php
function color($text, $color) {
    $colors = [
        'green' => "\033[32m",
        'red' => "\033[31m",
        'yellow' => "\033[33m",
        'cyan' => "\033[36m",
        'reset' => "\033[0m"
    ];
    return $colors[$color] . $text . $colors['reset'];
}

function listTools() {
    $tools = glob(__DIR__ . '/tools/*.php');
    $list = [];
    foreach ($tools as $tool) {
        $list[] = basename($tool, '.php');
    }
    return $list;
}

while (true) {
    echo "\n" . color("📌  Console Artisanale du Projet", "cyan") . "\n\n";

    $tools = listTools();
    foreach ($tools as $index => $tool) {
        echo ($index + 1) . '. ' . color($tool, 'yellow') . "\n";
    }
    echo (count($tools) + 1) . '. ' . color('Quitter', 'red') . "\n\n";

    echo "Ton choix : ";
    $choice = trim(fgets(STDIN));

    if (!is_numeric($choice) || $choice < 1 || $choice > count($tools) + 1) {
        echo color("❌ Choix invalide.\n", 'red');
        continue;
    }

    if ($choice == count($tools) + 1) {
        echo color("\n✔ Au revoir !\n", 'green');
        exit(0);
    }

    $selectedTool = $tools[$choice - 1];
    echo color("\n✔ Exécution de [$selectedTool]...\n\n", 'green');
    require __DIR__ . "/tools/$selectedTool.php";

    echo "\n" . color("✔ Terminé.", 'green') . "\n";
    echo "\n";
}
