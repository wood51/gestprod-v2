export const optionsMonthPerformance = {
  series: [
    {
      name: "Performance",
      color:'#6366f1'
    }
  ],
  chart: {
    height:'100%',
    type: "area",
    zoom: {
      enabled: false
    }
  },
  dataLabels: {
    enabled: false
  },
  stroke: {
    
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
        fontWeight:'bold',
      },
      formatter: (val) => {return val.toFixed(2); }
    }
  },
  annotations: {
    yaxis: [
      {
        y:1, 
        y2: 1.01,
        offsetY:1,
        strokeDashArray: 0,
        borderColor: "#ff0000",
        fillColor: "#ff0000",
        opacity:1,
        max:5,
        min:0
      }
    ]
  },
};
