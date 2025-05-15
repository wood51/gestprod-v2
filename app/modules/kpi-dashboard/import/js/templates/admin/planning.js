import { ListCraft } from "/app/views/js/components/ListCraft/ListCraft.js";
  let planning = null;

  // Formatter complet pour les statuts
  const externalFormatters = {
    statusFormatter: (rowData, tableCell) => {
      return `<span class="inline-flex items-center px-3 py-1 my-2  font-semibold leading-tight rounded-full" 
                  style="color:${rowData.fg_color};background:${rowData.bg_color};">
                  ${rowData.status}
                  </span>`;
    },
    articleFormatter: (rowData, tableCell) => {
      const articleName = rowData.libelle;
      const colorHex = rowData.modele_couleur; // Couleur associée à l'article, provenant de la BDD

      // Ajouter le rectangle coloré et le nom de l'article
      return `<div class="flex items-center">
                    <div class="w-4 h-10  mr-4 border border-black" style="background-color: ${rowData.modele_couleur};"></div>
                    <span>${rowData.libelle}</span>
                  </div>`;
    }
  };

  function loadPlanning(dataUrl) {
    const planningContainer = document.getElementById("planning-container");

    // Configuration du tableau via la classe List
    const listStructure = {
      enableFilter: true,
      paginate: 14,
      insertEmptyLine: true,
      columns: [
        // { name:"Select.",select: true, multiselect: true , filter:false}, // Colonne de sélection
        { name: "Articles", data: "libelle", formatter: "articleFormatter" },
        { name: "Numéro", data: "numero" },
        { name: "Statut", data: "status", formatter: "statusFormatter" },
        { name: "Semaine", data: "semaine" },
        { name: "Engagement", data: "engagement" }
      ]
    };

    // Afficher un message de chargement pendant la récupération des données
    planningContainer.innerHTML = '<p class="text-center text-gray-500">Chargement du planning...</p>';

    // Appeler l'API et charger le tableau
    try {
      planningContainer.innerHTML = "";
      planning = new ListCraft("#planning-container", listStructure, dataUrl, externalFormatters);
    } catch (error) {
      planningContainer.innerHTML = `<p class="text-center text-pink-500">Erreur lors du chargement du planning -> ${error}</p>`;
    }
  }

  let livree = document.querySelector("#checkLivree").checked ? 1 : 0;
  loadPlanning(`/planning/${livree}`);

  document.querySelector("#checkLivree").addEventListener("change", (event) => {
    event.preventDefault();
    livree = event.target.checked ? 1 : 0;
    planning.updateData(`/planning/${livree}`);
  });

  const tableBody = document.getElementById("planning-container");
  const contextMenu = document.getElementById("contextMenu");

  // Fonction pour afficher le menu contextuel
  function showContextMenu(event, rowId) {
    event.preventDefault();

    const { pageX, pageY } = event;

    // Positionnement dynamique
    const screenWidth = window.innerWidth;
    const screenHeight = window.innerHeight;
    const { menuWidth, menuHeight } = getMenuDimensions(contextMenu);

    const posX = pageX + menuWidth > screenWidth ? pageX - menuWidth : pageX;
    const posY = pageY + menuHeight > screenHeight ? pageY - menuHeight : pageY;

    contextMenu.style.left = `${posX}px`;
    contextMenu.style.top = `${posY}px`;

    contextMenu.classList.remove("hidden");

    console.log(`Menu contextuel ouvert pour la ligne ${rowId}`);
    // openModal();

    // Fermer le menu lorsqu'on clique ailleurs
    document.addEventListener(
      "click",
      () => {
        contextMenu.classList.add("hidden");
      },
      { once: true }
    );
  }

  // Gérer les clics droits sur les lignes
  tableBody.addEventListener("contextmenu", (event) => {
    const target = event.target.closest(".listCraft-row");
    if (target) {
      const rowId = target.dataset.id;
      showContextMenu(event, rowId);
    }
  });

  function getMenuDimensions(menuElement) {
    // Sauvegarde l'état initial
    const wasHidden = menuElement.classList.contains("hidden");

    if (wasHidden) {
      menuElement.classList.remove("hidden"); // Affiche temporairement
    }

    const dimensions = {
      menuWidth: menuElement.offsetWidth,
      menuHeight: menuElement.offsetHeight
    };

    if (wasHidden) {
      menuElement.classList.add("hidden"); // Re-masque le menu
    }

    return dimensions;
  }