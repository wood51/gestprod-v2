/**
 * Module de gestion de la récupération des données json via une requête HTTP.
 * @module dataUtils
 */

/**
 * Récupère des données depuis une URL spécifiée.
 * @async
 * @private
 * @param {string} url - L'URL depuis laquelle récupérer les données.
 * @throws {Error} - Lance une erreur si l'URL est vide ou si la requête échoue.
 * @returns {Promise<Object>} - Les données récupérées sous forme d'objet JSON.
 */
export async function fetchData(url) {
  if (!url) {
    throw new Error("L'URL ne peut pas être vide.");
  }

  try {
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`Erreur lors de la récupération des données : ${response.statusText}`);
    }
    return await response.json();
  } catch (error) {
    console.error("Erreur dans fetchData:", error);
    throw error; // Rejette l'erreur pour être gérée par la fonction appelante
  }
}
