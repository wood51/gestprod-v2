# 🛠️ Cycle de vie d'un engagement (`prod_engagements`)

## 🎯 Objectif
Permettre le suivi clair et traçable des engagements de production, avec prise en compte des modifications, reports, annulations et retours client.

---

## 📊 Statuts possibles (`status`)

| Statut           | Description                                                                 |
|------------------|-----------------------------------------------------------------------------|
| `en attente`     | Planning lointain ou en cours de définition. Aucun engagement réel encore. |
| `prévu`          | Décision prise : on engage la production.                                   |
| `reporté`        | Engagement repoussé. Nécessite une nouvelle ligne si on retente plus tard.  |
| `annulé`         | Annulé définitivement.                                                     |
| `fait`           | Ligne réalisée en production.                                               |
| `retour client`  | Intervention post-livraison, à documenter (SAV, ajustement, etc.).         |

---

## 🔁 Règle métier

- Une ligne = **un cycle d'engagement** (tentative).
- Si l'engagement est **modifié** (reporté, annulé) → on **modifie la ligne existante**.
- Si on **retente la production** → **nouvelle ligne**, pour garantir la traçabilité.

---

## 📅 Colonne `semaine_engagee`

- Vide tant que `status = 'en attente'`.
- Renseignée **au passage en `prévu`**.
- Reflète la **semaine réellement prévue** pour l'engagement.
- Permet d'analyser les écarts avec le planning théorique (`prod_planning.semaine`).

---



