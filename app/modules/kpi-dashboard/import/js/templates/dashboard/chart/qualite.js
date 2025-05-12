export const optionsQualite = {
    chart: {
      type: "radialBar",
      height: "120%",
      offsetY: ""
    },
    series: [0], // Pourcentage de performance
    plotOptions: {
      radialBar: {
        track: {
          background: "#e7e7e7",
          strokeWidth: "97%",
          margin: 5 // space between track and bar
        },
        dataLabels: {
          name: {
            show: false
          },
          value: {
            fontSize: "40px",
            offsetY: 10,
            formatter: (val) => {
              return val + "%";
            }
          }
        }
      }
    },
    fill: {
      colors: [({ value }) => (value < 30 ? "#ff0000" : value < 80 ? "#FBBF24" : "#16a34a")]
    }
  };
