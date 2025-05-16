class ApexChartManager {
    constructor(chartId, options) {
        this.chartId = chartId;
        this.options = options;
        this.chart = null;
    }

    init() {
        if (this.chart) this.destroy();
        this.chart = new ApexCharts(document.querySelector(`${this.chartId}`), this.options);
        this.chart.render();
    }

    updateSeries(newSeries) {
        if (this.chart) {
            this.chart.updateSeries(newSeries);
        }
    }

    updateOptions(newOptions) {
        if (this.chart) {
            this.chart.updateOptions(newOptions);
        }
    }

    destroy() {
        if (this.chart) {
            this.chart.destroy();
            this.chart = null; // Réinitialiser la variable après destruction
        }
    }

}

// On rend la classe accessible globalement
window.ChartManager = ApexChartManager;

