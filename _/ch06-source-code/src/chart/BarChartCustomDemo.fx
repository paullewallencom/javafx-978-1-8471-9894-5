package chart;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.Font;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.part.CategoryAxis;
import javafx.scene.chart.part.NumberAxis;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import javafx.scene.chart.data.Series;
import javafx.scene.chart.data.Data;
import javafx.scene.Node;


var cats = ["Q32009", "Q32008"];

def width = 640;
def barWidth = (width/6) - 30;
var dataSeries = [
    BarChart.Series {
        name: "Nokia"
        data: [
            BarChart.Data {category: cats[0] value: 16.1},
            BarChart.Data {category: cats[1] value: 15.4}
        ]
        barCreator:function(series:Series, pos:Integer, data:Data):Node{
            ImageView{image:Image{url:"{__DIR__}nokia.png" width:barWidth}}
        }
    },
    BarChart.Series {
        name: "RIM"
        data: [
            BarChart.Data {category: cats[0] value: 8.5},
            BarChart.Data {category: cats[1] value: 5.8}
        ]
        barCreator:function(series:Series, pos:Integer, data:Data):Node{
            ImageView{image:Image{url:"{__DIR__}bb.png" width:barWidth}}
        }
    },
    BarChart.Series {
        name: "Apple"
        data: [
            BarChart.Data {category: cats[0] value: 7},
            BarChart.Data {category: cats[1] value: 4.7}
        ]
        barCreator:function(series:Series, pos:Integer, data:Data):Node{
            ImageView{image:Image{url:"{__DIR__}iphone.png" width:barWidth}}
        }
    }
];

Stage {
  title: "Gartner Smartphone Sales"
  scene: Scene {
    content: [
      BarChart {
        width:640
        title: "Gartner Smartphone Sales"
        titleFont: Font { size: 24 }
        categoryAxis:CategoryAxis {
            categories:cats
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
