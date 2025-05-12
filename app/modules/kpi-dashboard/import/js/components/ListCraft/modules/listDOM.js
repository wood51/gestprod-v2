/**
 * Module de création des divers éléments DOM de la table
 * @module listDOM
 */
import { createElement, getFirstDataRowHeight } from "./domUtils.js";

/***************************************************************************/
/* Fonctions Publiques                                                     */
/***************************************************************************/

/**
 * Crée une table dans un élément conteneur spécifié.
 * @public
 * @param {HTMLElement} element - Le conteneur dans lequel la table sera ajoutée.
 * @param {Object} listStructure - La structure décrivant la liste (classes CSS, colonnes, etc.).
 * @returns {HTMLTableElement} - L'élément `table` créé.
 */
export function createTable(element, listStructure) {
  try {
    const table = createElement("table", [...(listStructure.listClass || []), "listCraft-table"]);
    element.appendChild(table);
    return table;
  } catch (error) {
    throw new Error(`ListCraft - createTable : Erreur lors de la création de la liste (${error})`);
  }
}

/**
 * Crée l'en-tête de la table.
 * @public
 * @param {HTMLTableElement} tableElement - L'élément table auquel l'en-tête sera ajouté.
 * @param {Object} listStructure - La structure décrivant la liste (classes CSS, colonnes, etc.).
 * @returns {NodeList|void} - Renvoie les éléments DOM des filtres si présents, sinon rien.
 */
export function createHeaders(tableElement, listStructure) {
  try {
    let colspan = 0;
    const tableHeaders = createElement("tr", [...(listStructure.headerClass || []), "listCraft-header"]);

    listStructure.columns.forEach((column) => {
      const headerCell = createElement("th", [...(column.headerCellClass || []), "listCraft-headers-cells", `listCraft-headers-cells-${column.name}`]);
      if (column.name) headerCell.innerHTML = column.name;

      if (column.colspan) {
        colspan = parseInt(column.colspan, 10);
        if (!isNaN(colspan)) {
          headerCell.setAttribute("colspan", colspan);
        } else {
          console.warn(`listCraft - createHeaders : Valeur colspan non valide : ${column.colspan}`);
        }
      }

      if (listStructure.enableFilter) {
        createFilters(headerCell, listStructure, `Rechercher ${column.name}`, column);
      }

      tableHeaders.appendChild(headerCell);
    });

    tableElement.appendChild(tableHeaders);

    if (listStructure.enableFilter) {
      return tableElement.querySelectorAll(".listCraft-filter-column");
    }
  } catch (error) {
    throw new Error(`ListCraft - createHeaders : Erreur lors de la création des en-têtes (${error})`);
  }
}

export function createFooter(tableElement, listStructure, pagination, eventHandlers) {
  // Vérifie s'il existe déjà un footer et le supprime s'il est présent
  const existingFooter = tableElement.querySelector("tfoot");
  if (existingFooter) {
    existingFooter.remove();
  }

  // Crée un nouvel élément de pied de page (tfoot)
  const tfoot = createElement("tfoot");
  const footerRow = createElement("tr");
  const footerCell = createElement("td", "listCraft-footer-cell");
  footerCell.setAttribute("colspan", listStructure.columns.length + (listStructure.select ? 1 : 0));

  // Création du container de pagination
  const paginationContainer = createElement("div", [...(listStructure.footerClass || []), "listCraft-footer-container"]);

  // Ajout des contrôles de pagination au container
  const paginationControls = createPaginationControls(pagination, eventHandlers);
  paginationContainer.appendChild(paginationControls);

  const pageInfos = createPageInfos(pagination);
  paginationContainer.appendChild(pageInfos);

  footerCell.appendChild(paginationContainer);
  footerRow.appendChild(footerCell);
  tfoot.appendChild(footerRow);
  tableElement.appendChild(tfoot);
}

/**
 * Crée les lignes de la table avec les données fournies.
 * @public
 * @param {HTMLTableElement} tableElement - L'élément table auquel les lignes seront ajoutées.
 * @param {Object} listStructure - La structure décrivant la liste.
 * @param {Object} pagination - Informations de pagination (page actuelle, nombre maximal par page).
 * @param {Array} data - Données à afficher dans la table.
 */
export function createRows(tableElement, listStructure, pagination, data) {
  try {
    const fragment = document.createDocumentFragment();
    let dataSubSet = null;
    let emptyRows = 0;

    if (pagination) {
      const currentPage = pagination.currentPage;
      const start = (currentPage - 1) * pagination.maxPerPage;
      const end = start + pagination.maxPerPage;
      dataSubSet = data.slice(start, end);
      emptyRows = pagination.maxPerPage - dataSubSet.length;
    } else {
      dataSubSet = data;
    }

    if (dataSubSet.length > 0) {
      dataSubSet.forEach((rowData) => {
        createTableRow(fragment, listStructure, rowData);
      });

      tableElement.appendChild(fragment);
      createEmptyRows(tableElement, emptyRows, listStructure);
    } else {
      tableElement.appendChild(fragment);
      createEmptyRows(tableElement, emptyRows, listStructure, true);
    }
  } catch (error) {
    console.error("Erreur lors de la création des lignes:", error);
  }
}

/***************************************************************************/
/* Fonctions Privées - createHeaders                                       */
/***************************************************************************/

/**
 * Crée un input de filtrage pour une cellule d'en-tête spécifique.
 * @private
 * @param {HTMLElement} headerCellElement - La cellule d'en-tête à laquelle l'input de filtrage sera ajouté.
 * @param {Object} listStructure - La structure décrivant la liste (classes CSS pour le filtre, etc.).
 * @param {string} placeHolder - Le texte de remplacement pour l'input de filtrage.
 * @param {string} dataColumn - Data de la colonne associée.
 */
function createFilters(headerCellElement, listStructure, placeHolder, column) {
  console.log(column);
  let filterInput = null;
  if (column.filter === false) {
    filterInput = createElement("div", "listCraft-filter-column-false");
    filterInput.innerHTML = "&nbsp;";
  } else {
    filterInput = createElement("input", [...(listStructure.filterClass || []), "listCraft-filter-column"]);
    if (column.filter?.type) {
      filterInput.type = column.filter.type;
      if (column.filter?.strict) {
        filterInput.setAttribute("data-strict",column.filter.strict);
      }
      if  (column.filter?.min && column.filter.type==="number") filterInput.setAttribute("min",column.filter.min)
      if  (column.filter?.max&& column.filter.type==="number") filterInput.setAttribute("max",column.filter.max)

    } else {
      filterInput.type = "text";
    }
  }

  filterInput.placeholder = placeHolder;
  filterInput.setAttribute("data-column", column.data);
  headerCellElement.appendChild(filterInput);
}

/***************************************************************************/
/* Fonctions Privées - createFooter                                        */
/***************************************************************************/

/**
 * Crée les contrôles de pagination (boutons "Précédent" et "Suivant").
 * @private
 * @param {Object} pagination - L'objet contenant les informations de pagination (page actuelle, nombre de pages, etc.).
 * @param {Object} eventHandlers - Les gestionnaires d'événements pour les boutons de pagination.
 * @returns {HTMLElement} - Un élément div contenant les contrôles de pagination.
 */
function createPaginationControls(pagination, eventHandlers) {
  const pageControls = createElement("div", "listCraft-paginations-controls");

  // Bouton "Précédent"
  const prevButton = createElement("button", "listCraft-pagination-buttons");
  prevButton.innerHTML = "Précédent";
  prevButton.disabled = pagination.currentPage === 1;
  prevButton.addEventListener("click", eventHandlers.handlePrevPage);
  pageControls.appendChild(prevButton);

  // Bouton "Suivant"
  const nextButton = createElement("button", "listCraft-pagination-buttons");
  nextButton.innerHTML = "Suivant";
  nextButton.disabled = pagination.currentPage === pagination.nbPages;
  nextButton.addEventListener("click", eventHandlers.handleNextPage);
  pageControls.appendChild(nextButton);

  return pageControls;
}

/**
 * Crée l'élément d'information sur la pagination
 * @private
 * @param {Object} pagination - L'objet contenant les informations de pagination (page actuelle, nombre de pages, etc.).
 * @returns {HTMLElement} - Un élément div contenant les contrôles de pagination.
 */
function createPageInfos(pagination) {
  // Création de la partie gauche avec les informations de page et d'enregistrement -> !!!!!!!!!!!!!!!! plus tard
  const pageInfo = createElement("div", "listCraft-pagination-infos");
  pageInfo.innerHTML = `Page ${pagination.currentPage} sur ${pagination.nbPages} - Total : ${pagination.totalLigne} enregistrements`;
  return pageInfo;
}

/***************************************************************************/
/* Fonctions Privées - createRows                                          */
/***************************************************************************/

/**
 * Crée une ligne de la table à partir des données de la colonne.
 * @private
 * @param {DocumentFragment} fragment - Fragment DOM dans lequel la ligne sera ajoutée.
 * @param {Object} listStructure - La structure décrivant la liste.
 * @param {Object} rowData - Données de la ligne à insérer.
 */
function createTableRow(fragment, listStructure, rowData) {
  const tableRow = createElement("tr", [...(listStructure.rowClass || []), "listCraft-row"]);

  tableRow.setAttribute("data-id",rowData.id);

  if (listStructure.rowDataAttribute) {
    const attributeName = listStructure.rowDataAttribute.name;
    const attributeValue = rowData[listStructure.rowDataAttribute.value];
    tableRow.setAttribute(`data-${attributeName}`, attributeValue);
  }

  listStructure.columns.forEach((column) => {
    createTableRowCell(tableRow, rowData, column);
  });

  fragment.appendChild(tableRow);
}

/**
 * Crée une cellule de ligne de la table à partir des données de la colonne.
 * @private
 * @param {HTMLElement} rowElement - Élément de ligne de la table auquel la cellule sera ajoutée.
 * @param {Object} rowData - Données de la ligne actuelle.
 * @param {Object} column - Structure de la colonne actuelle.
 */
function createTableRowCell(rowElement, rowData, column) {
  const tableCell = createElement("td");
  tableCell.setAttribute("data-column", column.data);
  let cellContent = "";

  if (column.backgroundColor) {
    tableCell.style.backgroundColor = rowData[column.backgroundColor] || column.backgroundColor;
  }

  if (column.data) {
    const cellData = rowData[column.data] || "";
    cellContent = column.formatter ? column.formatter(rowData, tableCell) : cellData;
  }

  if (column.html) {
    tableCell.innerHTML = column.html.replace(/\${(.*?)}/g, (_, field) => rowData[field.trim()] || "");
  } else {
    if (cellContent instanceof HTMLElement) {
      tableCell.appendChild(cellContent);
    } else {
      tableCell.innerHTML = cellContent;
    }
  }

  rowElement.appendChild(tableCell);
}

/**
 * Crée des lignes vides dans la table pour compléter la page.
 * @private
 * @param {HTMLTableElement} tableElement - L'élément table auquel les lignes vides seront ajoutées.
 * @param {number} nbRows - Nombre de lignes vides à ajouter.
 * @param {Object} listStructure - La structure décrivant la liste.
 */
function createEmptyRows(tableElement, nbRows, listStructure, noData = false) {
  if (nbRows > 0 && listStructure.insertEmptyLine === true) {
    const fragment = document.createDocumentFragment();
    const colspan = listStructure.columns.length + (listStructure.select || listStructure.multiselect ? 1 : 0);

    if (noData) {
      const noDataRow = createElement("tr", ["listCraft-row", ...(listStructure.rowClass || [])]);
      const noDataCell = createElement("td", "listCraft-noData-cell");
      noDataCell.setAttribute("colspan", colspan);
      //noDataCell.style.height = "50px";
      noDataCell.innerHTML = "Pas de données";
      noDataRow.appendChild(noDataCell);
      tableElement.appendChild(noDataRow);
      nbRows--;
    }

    const rowHeight = getFirstDataRowHeight(tableElement);

    for (let i = 0; i < nbRows; i++) {
      const emptyRow = createElement("tr", ["listCraft-empty-row", ...(listStructure.rowClass || [])]);
      const emptyCell = createElement("td");
      emptyCell.setAttribute("colspan", colspan);
      emptyRow.appendChild(emptyCell);

      if (rowHeight) {
        emptyRow.style.height = `${rowHeight}px`;
      }

      fragment.appendChild(emptyRow);
    }
    tableElement.appendChild(fragment);
  }
}
