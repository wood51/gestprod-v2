#!/bin/bash

# Exceution :
# chmod +x docker/fix-perm.sh
# ./docker/fix-perm.sh
# Ce script corrige les permissions des dossiers utilisés par le conteneur Docker


echo "🔧 Correction des permissions en cours..."

# Utilisateur utilisé par Apache dans le conteneur
APACHE_USER=www-data

# Liste des dossiers à corriger
FOLDERS=(tmp app/logs docker/bdd_data)

for DIR in "${FOLDERS[@]}"; do
  if [ -d "$DIR" ]; then
    echo "➡️  Correction de $DIR"
    sudo chown -R $APACHE_USER:$APACHE_USER "$DIR"
    sudo chmod -R 775 "$DIR"
  else
    echo "⚠️  Dossier $DIR introuvable. Création..."
    sudo mkdir -p "$DIR"
    sudo chown -R $APACHE_USER:$APACHE_USER "$DIR"
    sudo chmod -R 775 "$DIR"
  fi
done

echo "✅ Permissions corrigées avec succès."
