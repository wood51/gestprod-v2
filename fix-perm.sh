#!/bin/bash

# --- 2. Fix des permissions de base (node/npm) ---
echo "🔧 Correction des droits locaux (node_modules, etc.)"
sudo chown -R $USER:$USER .


# --- 4. Fix des permissions pour Apache & MariaDB ---
echo "🔐 Correction des permissions web"
FOLDERS=(tmp app/logs docker/bdd_data)

for DIR in "${FOLDERS[@]}"; do
  if [ -d "$DIR" ]; then
    echo "➡️  Correction de $DIR"
    sudo chown -R www-data:www-data "$DIR"
    sudo chmod -R 775 "$DIR"
  else
    echo "📁 Création de $DIR"
    sudo mkdir -p "$DIR"
    sudo chown -R www-data:www-data "$DIR"
    sudo chmod -R 775 "$DIR"
  fi
done

echo "✅ Installation terminée, projet prêt !"
