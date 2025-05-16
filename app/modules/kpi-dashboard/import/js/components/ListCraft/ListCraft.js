import { onDocumentReady, createElement } from "./modules/domUtils.js"; // Import de la fonction utilitaire
import { fetchData } from "./modules/dataUtils.js";
import { createTable, createHeaders, createRows, createFooter } from "./modules/listDOM.js";

/**
 * Représente la classe ListCraft, utilisée pour créer dynamiquement des tables HTML à partir de données JSON.
 *
 * @class ListCraft
 * @classdesc Cette classe gère la création et la gestion de tables HTML de manière dynamique.
 * Elle permet de récupérer des données, d'appliquer des filtres, de gérer la pagination, et de rendre
 * les tables interactives. Elle est idéale pour des applications nécessitant des tables dynamiques avec
 * des fonctionnalités d'administration comme le filtrage et la pagination.
 *
 * @example
 * const maListe = new ListCraft(document.getElementById("conteneur"), listStructure, "/api/data");
 *
 * @param {HTMLElement} element - Le conteneur cible où la table doit être ajoutée.
 * @param {Object} listStructure - La structure de la liste (définit les colonnes et leur format).
 * @param {string} dataUrl - L'URL pour récupérer les données JSON.
 * @param {Object} [externalFormatters={}] - Objet contenant des fonctions de formatage supplémentaires.
 */
export class ListCraft {
  #element = null;
  #table = null;
  #listStructure = {};
  #dataUrl = null;
  #data = [];
  #originalData = [];
  #pagination = null;
  domReady = false;
  #initPromise;
  #eventHandlers = null;

  constructor(element, listStructure, dataUrl, externalFormatters = {}) {
    this.#element = document.querySelector(element);
    this.#listStructure = listStructure;
    this.#dataUrl = dataUrl;
    this.externalFormatters = externalFormatters;

    this.#eventHandlers = {
      handlePrevPage: this.#handlePrevPage.bind(this),
      handleNextPage: this.#handleNextPage.bind(this)
    };

    // Initialisation automatique après que le document soit prêt
    this.#init();
  }

  /**
   * Fonction d'initialisation de la liste
   * @private
   */
  async #init() {
    try {
      // Attente DOM Ready
      this.#initPromise = await onDocumentReady();

      // Récupération des données
      this.#originalData = await fetchData(this.#dataUrl);
      this.#data = [...this.#originalData]; // Initialise #data avec les données originales

      // Gestion de la pagination, si nécessaire
      if (this.#listStructure.paginate) {
        this.#paginate();
      }

      // Mappage des formaters
      this.#mapFormatters();

      // Creation de la Table
      this.#table = createTable(this.#element, this.#listStructure);

      // Création de l'entête
      const filters = createHeaders(this.#table, this.#listStructure);

      // assignation des events filtre si besoin
      filters.forEach((filter, index) => {
        let strict = false;
        if (filter.dataset.strict) strict = true;
        filter.addEventListener("keyup", () => {
          this.#applyFilters(strict); // Appelle la méthode applyFilters() définie dans la classe
        });

        if (["number"].includes(filter.type)) {
          filter.addEventListener("change", () => {
            this.#applyFilters(strict); // Applique les filtres lorsque la valeur change
          });
        }
      });

      // Création des lignes du tableau
      createRows(this.#table, this.#listStructure, this.#pagination, this.#data);

      // Création du footer pour la pagination
      if (this.#listStructure.paginate) {
        createFooter(this.#table, this.#listStructure, this.#pagination, this.#eventHandlers);
      }
    } catch (error) {
      console.error("Erreur lors de l'initialisation:", error);
      throw new Error(`Erreur pendant l'initialisation de la liste : ${error.message}`);
    }
  }

  /**
   * Mappage des formaters externe pour modification a la volée des cellules
   */
  #mapFormatters() {
    this.#listStructure.columns.forEach((column) => {
      if (column.formatter) {
        const formatterFunc = this.externalFormatters[column.formatter.trim()];
        column.formatter = typeof formatterFunc === "function" ? formatterFunc : null;
      }
    });
  }

  /**
   * Calcul des informations de pagination
   * @private
   */
  #paginate(currentPage = 1) {
    this.#pagination = {
      maxPerPage: this.#listStructure.paginate,
      totalLigne: this.#data.length,
      nbPages: this.#data.length > 0 ? Math.ceil(this.#data.length / this.#listStructure.paginate) : 1,
      currentPage: currentPage
    };
  }

  /**
   * Gestion pagination de l'événement de page précédente
   * @private
   * @param {Event} event
   */
  #handlePrevPage(event) {
    event.preventDefault();
    const currentPage = this.#pagination.currentPage;
    if (currentPage !== 1) {
      this.#pagination.currentPage--;
      this.#refreshList();
    }
  }

  /**
   * Gestion pagination de l'événement de page suivante
   * @private
   * @param {Event} event
   */
  #handleNextPage(event) {
    event.preventDefault();
    const currentPage = this.#pagination.currentPage;
    const nbPages = this.#pagination.nbPages;
    if (currentPage !== nbPages) {
      this.#pagination.currentPage++;
      this.#refreshList();
    }
  }

  /**
   * Rafraîchissement de la liste
   * @private
   */
  #refreshList() {
    console.log("Refresh");

    if (this.#listStructure.paginate) {
      this.#pagination.currentPage = this.#data.length <= this.#pagination.maxPerPage ? 1 : this.#pagination.currentPage;
      this.#paginate(this.#pagination.currentPage);
    }

    const tr = this.#table.querySelectorAll("tr:not(:first-child)");
    tr.forEach((row) => {
      row.remove();
    });

    createRows(this.#table, this.#listStructure, this.#pagination, this.#data);

    if (this.#listStructure.paginate) {
      createFooter(this.#table, this.#listStructure, this.#pagination, this.#eventHandlers);
    }
  }

  #applyFilters(strict = false) {
    // Réinitialiser #data à partir des données originales
    let filteredData = [...this.#originalData];

    // Appliquer chaque filtre actif
    this.#table.querySelectorAll(".listCraft-filter-column").forEach((input) => {
      const filterValue = input.value.trim().toLowerCase();
      const columnName = input.dataset.column;

      if (filterValue) {
        filteredData = filteredData.filter((item) => {
          const cellValue = (item[columnName] || "").toString().toLowerCase();
          return strict
            ? cellValue === filterValue // Correspondance stricte
            : cellValue.includes(filterValue); // Correspondance flexible
        });
      }
    });
    this.#data = filteredData;

    // Rafraîchir la liste et paginer les résultats filtrés
    if (this.#listStructure.paginate) {
      this.#paginate(1);
    }
    this.#refreshList();
  }

  /***************************************************************************/
  /* Méthodes Publique                                                       */
  /***************************************************************************/

  /**
   * Mets à jour la liste reste ds la classe
   * @param {string} dataUrl
   */
  async updateData(dataUrl = null) {
    try {
      await this.#initPromise; // Assure que l'initialisation est terminée
      
      this.#originalData = await fetchData(dataUrl || this.#dataUrl);
      this.#data = [...this.#originalData];
      if (this.#listStructure.paginate) {
        console.log("paginate ");

        this.#paginate(1);
      }
      this.#refreshList();
    } catch (error) {
      this.#data = [];
      this.#refreshList();
      console.error("Erreur lors de la mise à jour des données:", error);
    }
  }
}
