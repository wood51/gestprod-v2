<?php
echo "Mot de passe à hasher (Bcrypt) : ";
$password = trim(fgets(STDIN));

if (!$password) {
    echo "❌ Aucun mot de passe fourni.\n";
    return;
}

$hash = password_hash($password, PASSWORD_BCRYPT);

echo "🔒 Hash Bcrypt :\n";
echo $hash . "\n";
