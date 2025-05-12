import { loadPage } from "/app/views/js/helpers/loadPage.js";

document.addEventListener("DOMContentLoaded", function () {
  loadPage("/admin/planning", "#main_content");

  // Sélectionner tous les éléments du menu
  document.querySelectorAll(".menu").forEach((button) => {
    button.addEventListener("click", async function (event) {
      event.preventDefault(); // Empêche le comportement par défaut du lien

      try {
        // Récupère l'URL cible à partir de l'attribut href du lien
        const targetUrl = this.getAttribute("href");
        loadPage(targetUrl, "#main_content");
      } catch (error) {
        console.error("Erreur:", error);
        alert("Une erreur est survenue lors du chargement du contenu.");
      }
    });
  });
});