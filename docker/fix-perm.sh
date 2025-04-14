#!/bin/bash

# --- 1. Clone le projet ---
REPO=$1

if [ -z "$REPO" ]; then
  echo "❌ Il faut spécifier l'URL du repo Git"
  echo "Usage : ./install-project.sh git@github.com:tonuser/tonprojet.git"
  exit 1
fi

# On extrait le nom du dossier (nom du repo sans .git)
PROJECT_NAME=$(basename "$REPO" .git)

# Clone
git clone "$REPO"
cd "$PROJECT_NAME" || exit 1

echo "📁 Projet cloné dans $PROJECT_NAME"

# --- 2. Fix des permissions de base (node/npm) ---
echo "🔧 Correction des droits locaux (node_modules, etc.)"
sudo chown -R $USER:$USER .

# --- 3. Install composer + npm ---
echo "📦 Installation des dépendances PHP et JS..."
composer install
npm install

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

# --- 5. Lancement de Docker ---
echo "🐳 Lancement des conteneurs Docker..."
docker-compose up -d

echo "✅ Installation terminée, projet prêt !"
