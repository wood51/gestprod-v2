<?php
$cacheDir = dirname(__DIR__, 2) . '/tmp/';

function deleteRecursive($dir) {
    if (!is_dir($dir)) return;
    foreach (scandir($dir) as $item) {
        if ($item == '.' || $item == '..') continue;
        $path = $dir . DIRECTORY_SEPARATOR . $item;
        if (is_dir($path)) {
            deleteRecursive($path);
            rmdir($path);
            echo "📁 Supprimé dossier : $path\n";
        } else {
            unlink($path);
            echo "🗑️ Supprimé fichier : $path\n";
        }
    }
}

if (!is_dir($cacheDir)) {
    echo "❌ Dossier cache inexistant : $cacheDir\n";
} else {
    deleteRecursive($cacheDir);
    echo "✔ Cache vidé !\n";
}
