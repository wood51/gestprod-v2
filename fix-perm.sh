#!/bin/bash

# --- 1. Fix des permissions de base (node/npm) ---
echo "🔧 Correction des droits locaux (node_modules, etc.)"
sudo chown -R $USER:$USER .

# --- 2. Fix des permissions pour Apache & MariaDB ---
echo "🔐 Correction des permissions web"
FOLDERS=(tmp app/logs docker/bdd_data)

for DIR in "${FOLDERS[@]}"; do
  if [ -d "$DIR" ]; then
    echo "➡️  Correction de $DIR"
  else
    echo "📁 Création de $DIR"
    sudo mkdir -p "$DIR"
  fi

  if [ "$DIR" == "docker/bdd_data" ]; then
    echo "🗄️  Dossier MariaDB → chown 999:999"
    sudo chown -R 999:999 "$DIR"
  else
    echo "🔐 Dossier Apache → chown www-data:www-data"
    sudo chown -R www-data:www-data "$DIR"
  fi

  sudo chmod -R 775 "$DIR"
done

echo "✅ Permissions corrigées, projet prêt !"
