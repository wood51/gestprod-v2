export function loadPage(url, container) {
  fetch(url)
    .then((response) => {
      if (!response.ok) throw new Error(`Erreur lors du chargement de ${url}`);
      return response.text();
    })
    .then((html) => {
      const targetContainer = document.querySelector(container);
      if (!targetContainer) throw new Error(`Le conteneur ${container} est introuvable.`);
      
      // Nettoyer le contenu existant
      while (targetContainer.firstChild) {
        targetContainer.removeChild(targetContainer.firstChild);
      }

      // Insérer le HTML
      const tempDiv = document.createElement("div");
      tempDiv.innerHTML = html;

      // Copier chaque enfant dans le conteneur
      Array.from(tempDiv.childNodes).forEach((node) => {
        targetContainer.appendChild(node.cloneNode(true));
      });

      // Exécuter les scripts dynamiquement
      const scripts = tempDiv.querySelectorAll("script");
      scripts.forEach((oldScript) => {
        const newScript = document.createElement("script");
        if (oldScript.type) newScript.type = oldScript.type; // Respecter les types (modules, etc.)
        if (oldScript.src) {
          newScript.src = `${oldScript.src}?_=${Date.now()}`; // Rechargement forcé
        } else {
          newScript.textContent = oldScript.textContent; // Copier le contenu JS inline
        }
        document.body.appendChild(newScript);
        document.body.removeChild(newScript); // Nettoyage
      });
    })
    .catch((error) => {
      console.error("Erreur:", error);
      document.querySelector(container).innerHTML =
        "<p class='text-red-500 text-center'>Impossible de charger le contenu.</p>";
    });
}
