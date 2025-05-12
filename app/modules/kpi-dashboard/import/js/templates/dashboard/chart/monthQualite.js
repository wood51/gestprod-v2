export const optionsMonthQualite = {
  series: [
    {
      name: "Défauts Majeurs",
      data: [
        { x: "Sem. 38", y: 5 },
        { x: "Sem. 39", y: 0 },
        { x: "Sem. 40", y: 6 },
        { x: "Sem. 41", y:0 }
      ],
      color: "#Ff0000"
    },
    {
      name: "Défauts Mineurs",
      data: [
        { x: "Sem. 38", y: 7 },
        { x: "Sem. 39", y: 5 },
        { x: "Sem. 40", y: 0 },
        { x: "Sem. 41", y: 1 }
      ],
      color: "#FBBF24"
    },
    {
      name: "Aucun Défauts",
      data: [
        { x: "Sem. 38", y: 18 },
        { x: "Sem. 39", y: 25 },
        { x: "Sem. 40", y: 24 },
        { x: "Sem. 41", y: 29 }
      ],
      color: "#34D399"
    }
  ],
  chart: {
    height: "100%",
    type: "bar",
    stacked: true,
    stackType: "100%",
    zoom: {
      enabled: false
    },
    toolbar: {
      show:false
    },
  },
  dataLabels: {
    enabled: true,
    style: {
      colors: ["#fff"]
    }
  },
  stroke: {
    show: true,
    width: 1,
    colors: ["#fff"]
  },
  xaxis: {
    type: "category",
    labels: {
      style: {
        fontSize: "14px",
        fontWeight:'bold'
      }
    }
  },
  yaxis: {
    labels: {
      style: {
        fontSize: "14px",
        fontWeight:'bold'
      }
    }
  },
  legend : {
    position: 'top',
    horizontalAlign: 'left', 
    fontSize: '14px',
    fontWeight:'bold'
  },
  plotOptions: {
    bar: {
      horizontal: true,
      barHeight: "30px",
      dataLabels: {
        position: "center"
       
      }
    }
  }
};
