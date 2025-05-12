import { optionsPerformance } from "/app/views/js/templates/dashboard/chart/perf.js";
import { optionsMonthPerformance } from "/app/views/js/templates/dashboard/chart/monthPerf.js";
import { optionsQualite } from "/app/views/js/templates/dashboard/chart/qualite.js";
import { optionsMonthQualite } from "/app/views/js/templates/dashboard/chart/monthQualite.js";
import { optionsEngagement } from "/app/views/js/templates/dashboard/chart/engagement.js";
import { optionsAleas } from "/app/views/js/templates/dashboard/chart/aleas.js";
import { DEBUG_MODE } from "/app/views/js/config.local.js";
import { getISOWeek, format } from "https://cdn.jsdelivr.net/npm/date-fns@4.1.0/+esm";

import { initClock } from "/app/views/js/components/clock/clock.js";
// Graphique en barres ApexCharts pour la Production Hebdomadaire
document.addEventListener("DOMContentLoaded", function () {
  let slides = document.querySelectorAll(".slide");
  initClock("clock");
  const week = getWeekAndYear();
  // pour debug
  //year = 2025;
  //let week = "2025-08";

  const perfChart = new ApexChartManager("#performance-chart", optionsPerformance);
  perfChart.init();
  fetch(`/performance/${week}`) //fix temporaire
    .then((response) => response.json())
    .then((data) => {
      const value = Math.min(Math.ceil(Number(data.performance)), 100);
      perfChart.updateSeries([value]); // Passe un tableau contenant le nombre
    })
    .catch((error) => {
      console.error("Erreur lors du chargement des données :", error);
    });

  const monthPerfChart = new ApexChartManager("#month-performance-chart", optionsMonthPerformance);
  monthPerfChart.init();
  fetch(`/performance-mois/${week}/5`)
    .then((response) => response.json())
    .then((data) => {
      monthPerfChart.updateSeries([data]); // Passe un tableau contenant le nombre
    })
    .catch((error) => {
      console.error("Erreur lors du chargement des données :", error);
    });

  const qualiteChart = new ApexChartManager("#qualite-chart", optionsQualite);
  qualiteChart.init();
  fetch(`/defauts/${week}`)
    .then((response) => response.json())
    .then((data) => {
      const value = Math.min(Math.ceil(Number(data.iq)), 100);
      console.log("update serie qualite:", data.iq);
      qualiteChart.updateSeries([value]);
    })
    .catch((error) => {
      console.error("Erreur lors du chargement des données :", error);
    });

  const monthQualiteChart = new ApexChartManager("#month-qualite-chart", optionsMonthQualite);
  monthQualiteChart.init();
  fetch(`/defauts/historique/${week}/4`)
    .then((response) => response.json())
    .then((data) => {
      // const value = Math.min(Math.ceil(Number(data.iq)), 100);
      console.log("update serie qualite:", data);
      monthQualiteChart.updateSeries(data);
    })
    .catch((error) => {
      console.error("Erreur lors du chargement des données :", error);
    });

  const engagementChart = new ApexChartManager("#engagement-chart", optionsEngagement);
  engagementChart.init();
  // fetch(`/engagement/${week}/${year}`)
  fetch(`/engagement/${week}`)
    .then((response) => response.json())
    .then((data) => {
      const options = {
        title: {
          text: data.title.text //   à jour le titre avec la nouvelle valeur
        },
        plotOptions: {
          bar: {
            columnWidth: data.barWidth
          }
        },
        series: data.series.data, // Mettez à jour les séries avec les nouvelles données
        annotations: data.annotations
      };
      engagementChart.updateOptions(options, true); // false pour ne pas redessiner immédiatement, ou true si nécessaire
      console.log("update options engagement:", options);
    })
    .catch((error) => {
      console.error("Erreur lors du chargement des données :", error);
    });

  // const aleasChart = new ApexChartManager("#aleas-chart", optionsAleas);
  // aleasChart.init();

  function showSlide(index) {
    slides.forEach((slide, i) => {
      index === i ? slide.classList.remove("hidden") : slide.classList.add("hidden");
    });
  }

  const pauseIndicator = document.getElementById("pauseIndicator");
  let slideIndex = 0;
  let pause = false;
  let slideInterval;

  function nextSlide() {
    slideIndex = (slideIndex + 1) % slides.length;
    showSlide(slideIndex);
  }

  showSlide(slideIndex); // Affiche le premier slide au démarrage

  function startSlideShow() {
    slideInterval = setInterval(nextSlide, 45000); // Change de slide toutes les 10 secondes
  }

  function stopSlideShow() {
    clearInterval(slideInterval);
  }

  document.body.onkeyup = function (e) {
    switch (e.code) {
      case "Space":
        nextSlide();
        break;
      case "KeyP":
        pause = !pause;
        if (pause) {
          pauseIndicator.classList.remove("invisible");
          stopSlideShow();
          console.log("Arrêt défillement");
        } else {
          pauseIndicator.classList.add("invisible");
          startSlideShow();
          console.log("Reprise défillement");
        }
        break;
    }
  };
});

function getWeekAndYear() {
  const now = new Date();
  const w = getISOWeek(now);
  const y = format(now, "yyyy");

  return `${y}-${String(w).padStart(2, "0")}`;
}
