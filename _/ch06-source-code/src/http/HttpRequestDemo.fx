package http;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.Group;
import javafx.scene.paint.Color;
import javafx.scene.layout.HBox;
import javafx.scene.control.TextBox;
import javafx.scene.control.Slider;
import javafx.io.http.URLConverter;
import javafx.io.http.HttpRequest;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.effect.Reflection;
import javax.imageio.ImageIO;
import javafx.ext.swing.SwingUtils;
import javafx.geometry.VPos;
import javafx.geometry.HPos;
import javafx.scene.control.Button;



def converter = URLConverter{}
def w = 640;
def h = 480;
def imgW = w * 0.8;
def imgH = h * 0.7;
def GOOGLE_KEY = "ABQIAAAAoV_CwkR1mUp9sySrirk9bhTGEj6WCqbisms9t6IYmZa6uZglnxSkAem-0jBpzcxB4JN0nrBXwhM7gQ";

var scene:Scene;
var loc  = converter.encodeString("Atlanta, GA");
var zoom:Number = 15;
var mapType="roadmap";

var imgView:ImageView;

var gmapUrl = bind "http://maps.google.com/maps/api/staticmap?"
		   "center={loc}"
		   "&zoom={zoom as Integer}"
		   "&size={imgW as Integer}x{imgH as Integer}"
		   "&maptype={mapType}"
		   "&format=png32"
		   "&sensor=false"
		   "&key={GOOGLE_KEY}"
                   on replace {
                       loadMapImage(gmapUrl);
                   };


function loadMapImage(url:String):Void{
    var http:HttpRequest = HttpRequest {
        location: url;
        onInput: function(is: java.io.InputStream) {
            try {
                if(is.available() > 0) {
                    var buffImg = ImageIO.read(is);
                    imgView.image = SwingUtils.toFXImage(buffImg);
                }
            } finally {
                is.close();
            }
        }

        onException: function(ex: java.lang.Exception) {
            println("onException - exception: {ex.getClass()} {ex.getMessage()}");
        }

        onConnecting:function() {}
        onDoneRead: function() {}
        onDone: function() {http.stop();}
    };
    http.start();
}

imgView = ImageView{
    fitHeight:imgH fitWidth:imgW
    preserveRatio:true
    effect: Reflection{fraction:0.25}
    layoutX:(w - imgW)/2 layoutY:20

};

var zoomCtrl = Slider {
    translateX: 20
    translateY: 80
    min: 1 max:20
    snapToTicks:true
    majorTickUnit:5

    vertical:true
    value: bind zoom with inverse
}


var controls = HBox {
    spacing:10 width:w nodeVPos:VPos.CENTER hpos:HPos.CENTER
    translateY : h - 100
    content:[
        TextBox {id:"addr"
            columns: 60 promptText: "Enter location"
            effect: Reflection{fraction:0.75}
        }
        Button{text:"Map" action:function() {
            def addr = (scene.lookup("addr") as TextBox).text;
            loc = converter.encodeString(addr);
        }}
    ]
}

var stage = Stage {
	width: w
	height: h
        title:"Google Static Map"
	scene: scene = Scene {
		fill:Color.BLACK
		content: [imgView, zoomCtrl, controls]
	}
}
