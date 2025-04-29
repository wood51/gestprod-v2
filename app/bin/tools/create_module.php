<?php
echo "Nom du module : ";
$moduleName = trim(fgets(STDIN));

if (!$moduleName) {
    echo "❌ Aucun nom de module fourni.\n";
    return;
}

$moduleName = ucfirst($moduleName);

$baseAppDir = dirname(__DIR__, 2) . '/' . $moduleName;
$baseViewDir = dirname(__DIR__, 2) . '/views/' . $moduleName;

$directories = [
    "$baseAppDir/controllers",
    "$baseAppDir/models",
    "$baseViewDir/partials",
];

foreach ($directories as $dir) {
    if (!is_dir($dir)) {
        mkdir($dir, 0755, true);
        echo "📁 Créé : $dir\n";
    }
}

$controllerContent = "<?php\n\nnamespace App\\$moduleName\\Controllers;\n\nclass " . $moduleName . "Controller\n{\n    public function index()\n    {\n        echo 'Hello from $moduleName Controller';\n    }\n}\n";
file_put_contents("$baseAppDir/controllers/{$moduleName}Controller.php", $controllerContent);

$modelContent = "<?php\n\nnamespace App\\$moduleName\\Models;\n\nclass " . $moduleName . "Model\n{\n    // Model logic here\n}\n";
file_put_contents("$baseAppDir/models/{$moduleName}Model.php", $modelContent);

$viewContent = "<h1>Hello from $moduleName View</h1>";
file_put_contents("$baseViewDir/index.php", $viewContent);

$moduleJson = [
    'name' => $moduleName,
    'created_at' => date('Y-m-d H:i:s')
];
file_put_contents("$baseAppDir/module.json", json_encode($moduleJson, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES));

echo color("✔ Module [$moduleName] créé avec succès !\n", 'green');
