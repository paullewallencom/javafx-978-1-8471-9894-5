package chart;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.Font;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.part.CategoryAxis;
import javafx.scene.chart.part.NumberAxis;

var categories = ["Q32009", "Q32008"];

var dataSeries = [
    BarChart.Series {
        name: "Nokia"
        data: [
            BarChart.Data {category: categories[0] value: 16.1},
            BarChart.Data {category: categories[1] value: 15.4}
        ]
    },
    BarChart.Series {
        name: "RIM"
        data: [
            BarChart.Data {category: categories[0] value: 8.5},
            BarChart.Data {category: categories[1] value: 5.8}
        ]
    },
    BarChart.Series {
        name: "Apple"
        data: [
            BarChart.Data {category: categories[0] value: 7},
            BarChart.Data {category: categories[1] value: 4.7}
        ]
    },
    BarChart.Series {
        name: "HTC"
        data: [
            BarChart.Data {category: categories[0] value: 2.7},
            BarChart.Data {category: categories[1] value: 1.7}
        ]
    },
    BarChart.Series {
        name: "Samsung"
        data: [
            BarChart.Data {category: categories[0] value: 1.3},
            BarChart.Data {category: categories[1] value: 1.1}
        ]
    },
    BarChart.Series {
        name: "Others"
        data: [
            BarChart.Data {category: categories[0] value: 5.4},
            BarChart.Data {category: categories[1] value: 7.8}
        ]
    }
];


Stage {
  title: "Smartphone Sales"
  scene: Scene {
    content: [
      BarChart {
        title: "Smartphone Sales"
        titleFont: Font { size: 24 }
        categoryAxis:CategoryAxis {
            categories:categories
        }
        valueAxis:NumberAxis{
            label:"Sales (100K)"
            upperBound:20
            lowerBound:0
        }

        data: bind dataSeries
      }
    ]
  }
}
