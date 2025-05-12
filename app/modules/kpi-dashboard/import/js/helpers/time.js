export function getCurrentWeek() {
    const currentDate = new Date();

    // Calcul de la semaine ISO 8601
    const yearStart = new Date(Date.UTC(currentDate.getFullYear(), 0, 1));
    const pastDaysOfYear = (currentDate - yearStart + (yearStart.getTimezoneOffset() - currentDate.getTimezoneOffset()) * 60000) / 86400000;

    // La semaine ISO commence à la première semaine avec au moins 4 jours
    const weekNumber = Math.ceil((pastDaysOfYear + yearStart.getUTCDay() - 1) / 7);

    // Définir la valeur au format "YYYY-WW"
    const isoWeek = `${currentDate.getFullYear()}-W${String(weekNumber).padStart(2, "0")}`;

    return isoWeek;
  }