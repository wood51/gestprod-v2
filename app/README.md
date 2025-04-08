
# Structure de l'application F3 modulaire

Ce projet utilise une architecture modulaire inspirée de Fat-Free Framework (F3), 
où chaque dossier de `/app` représente un module autonome, y compris `core`.

## Structure générale

```
/app
  /core         -> Noyau de l'application (router, DB, helpers globaux, etc.)
  /users        -> Module utilisateurs
  /planning     -> Module planning
  /messagerie   -> Module messagerie
  /views        -> Layout principal (HTML commun, DaisyUI, etc.)
```

Chaque module (y compris `core`) suit cette structure interne :

```
/<module>
  /controllers  -> Contrôleurs F3 du module
  /models       -> Modèles liés à la base de données
  /services     -> Logique métier locale
  /views        -> Templates spécifiques au module
  /helpers      -> Fonctions spécifiques ou utilitaires
  /migrations   -> Fichiers SQL pour ce module
```

## Avantages de cette approche

- Pas de "magie" cachée : chaque module est explicite et autonome
- Facilité de développement d'un module comme une mini-app
- Réduction des conflits de noms et séparation claire des responsabilités
- Possibilité de charger certains modules automatiquement ou manuellement selon le besoin

## Bonnes pratiques

- Préfixer les vues si besoin (`users_index.html`) pour éviter les conflits
- `core` reste le module central, mais traité comme les autres
- Les layouts globaux (sidebar, header, thème) sont placés dans `/app/views/layout/`
