/**
 * Utilitaires pour la gestion du DOM
 * @module domUtils
 */

/**
 * Exécute une fonction une fois que le document est prêt.
 * @public
 * @returns {Promise<void>} - Promesse résolue lorsque le document est prêt.
 */
export function onDocumentReady() {
  return new Promise((resolve) => {
    if (document.readyState === "loading") {
      document.addEventListener("DOMContentLoaded", resolve); // Retire les parenthèses ici pour passer la fonction, pas l'appel immédiat.
    } else {
      resolve();
    }
  });
}

/**
 * Crée un élément HTML avec des classes spécifiées.
 * @private
 * @param {string} tag - Le nom de la balise de l'élément à créer (par exemple, "div", "span").
 * @param {string | string[]} classes - La ou les classes CSS à ajouter à l'élément créé.
 * @returns {HTMLElement} - L'élément HTML créé avec les classes appliquées.
 */
export function createElement(tag, classes) {
  const element = document.createElement(tag);
  if (classes) {
    element.classList.add(...(Array.isArray(classes) ? classes.filter(Boolean) : [classes]));
  }
  return element;
}

/**
 * Obtient le nombre de colonnes dans un tableau HTML.
 * @private
 * @param {HTMLTableElement} tableElement - L'élément table dont on souhaite connaître le nombre de colonnes.
 * @returns {number} - Le nombre de colonnes dans la première ligne du tableau, ou 0 si le tableau n'est pas valide.
 */
export function getColsNumber(tableElement) {
  if (!tableElement || !(tableElement instanceof HTMLTableElement)) {
    console.error("L'élément fourni n'est pas une table valide.");
    return 0;
  }

  const firstRow = tableElement.rows[0];
  return firstRow ? firstRow.cells.length : 0;
}

/**
 * Obtient la hauteur de la première ligne de données du tableau.
 * @private
 * @param {HTMLTableElement} tableElement - L'élément table dont on souhaite connaître la hauteur de la première ligne de données.
 * @returns {number|undefined} - La hauteur de la première ligne de données en pixels, ou `undefined` si aucune ligne n'est trouvée.
 */
export function getFirstDataRowHeight(tableElement) {
  const firstDataRow = tableElement.querySelector(".listCraft-row");

  if (firstDataRow) {
    return firstDataRow.getBoundingClientRect().height;
  }
  return undefined;
}

// /**
//  * Ajoute des classes CSS à un élément HTML.
//  * @private
//  * @deprecated
//  * @param {HTMLElement} element - L'élément auquel ajouter les classes CSS.
//  * @param {string | string[]} classes - La ou les classes CSS à ajouter à l'élément.
//  */
// export function addClass(element, classes) {
//   if (classes) {
//     element.classList.add(...(Array.isArray(classes) ? classes.filter(Boolean) : [classes]));
//   }
// }

// /**
//  * Crée un élément HTML avec des classes spécifiées.
//  * @private
//  * @deprecated
//  * @param {string} tag - Le nom de la balise de l'élément à créer (par exemple, "div", "span").
//  * @param {string | string[]} classes - La ou les classes CSS à ajouter à l'élément créé.
//  * @returns {HTMLElement} - L'élément HTML créé avec les classes appliquées.
//  */
// export function createElementWithClasses(tag, classes) {
//   const element = document.createElement(tag);
//   if (classes) {
//     addClass(element, classes);
//   }
//   return element;
// }