
# GestProd V2

Suivi de production pour atelier de fabrication d'alternateurs pour groupes électrogènes (aéronautique).

## 🚀 Tech Stack

- PHP + [Fat-Free Framework (F3)](https://fatfreeframework.com/)
- HTMX
- TailwindCSS v4 / DaisyUI v5
- MariaDB (via Docker)
- JS

## 🛠️ Installation

```bash
# Cloner le repo
git clone git@github.com:ton-user/gestprod-v2.git

# Installer les dépendances si besoin (F3, tailwind, etc.)
# Lancer le conteneur MariaDB
docker-compose up -d
```

## 📁 Structure

```
app/
  ├─ modules/       → Modules métiers (auth, kpi, suivis...)
  ├─ views/         → Vues HTML + composants
  ├─ logs/          → Logs d’exécution (non versionnés)

```

## ⚠️ État actuel

🔧 En cours de développement — instable (tag `v0.1`).

## 📝 TODO

- [ ] Tout 😁