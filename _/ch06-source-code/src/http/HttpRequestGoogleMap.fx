package http;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.Group;
import javafx.scene.paint.Color;
import javafx.scene.effect.Reflection;
import javafx.scene.layout.HBox;
import javafx.scene.control.ProgressBar;
import javafx.scene.control.TextBox;
import javafx.scene.control.Slider;
import javafx.scene.control.Button;
import javafx.io.http.URLConverter;
import javafx.io.http.HttpRequest;
import javafx.scene.image.ImageView;
import javafx.ext.swing.SwingUtils;

import javax.imageio.ImageIO;
import javafx.geometry.HPos;
import javafx.geometry.VPos;

var w = 640;
var h = 480;
var bytesToRead:Long;
var currentBytesRead:Long;

var imgW = w * 0.8;
var imgH = h * 0.7;
var converter = URLConverter{}
var loc  = converter.encodeString("Atlanta, GA");
var zoom:Number = 15;
var mapType="roadmap";
def apiKey="ABQIAAAAoV_CwkR1mUp9sySrirk9bhTGEj6WCqbisms9t6IYmZa6uZglnxSkAem-0jBpzcxB4JN0nrBXwhM7gQ";

var gmapUrl = bind "http://maps.google.com/maps/api/staticmap?"
		   "center={loc}"
		   "&zoom={zoom as Integer}"
		   "&size={imgW as Integer}x{imgH as Integer}"
		   "&maptype={mapType}"
		   "&format=png32"
                   "&markers=color:blue|{loc}"
		   "&sensor=false"
		   "&key={apiKey}"
                   on replace {
                       loadMapImage(gmapUrl);
                   };

var imgView = ImageView{
    preserveRatio:true
    effect: Reflection{fraction:0.25}
    layoutX: (w - imgW)/2
    layoutY:10
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

        onToRead:function(toRead:Long) {bytesToRead = toRead}
        onRead:function(bytes:Long){currentBytesRead = bytes}

        onException: function(ex: java.lang.Exception) {
            println("onException - exception: {ex.getClass()} {ex.getMessage()}");
        }

        onDone: function() {http.stop();}
    };
    http.start();
}

var progInd = ProgressBar {
    progress: bind ProgressBar.computeProgress(bytesToRead, currentBytesRead)
}

var txtLoc:TextBox = TextBox {
    columns: 25
    promptText: "Enter location"
    action:function(){
        loc = converter.encodeString(txtLoc.text);
    }
}

var zoomCtrl = Slider {
    translateX: 20
    translateY: 80
    min: 1 max:20
    snapToTicks:true
    majorTickUnit:5

    vertical:true
    value: bind zoom with inverse
}

var mapBtn = Button{
    text:"Map"
    action:function() {
        mapType = "roadmap"
    }

}
var satBtn = Button{
    text:"Satellite"
    action:function() {
        mapType = "hybrid"
    }
}

var mapCtrl = HBox {
    spacing:10
    hpos:HPos.CENTER nodeVPos:VPos.CENTER
    width:w
    translateY : h - 100
    content:[txtLoc, mapBtn, satBtn, progInd]
}

var ctrl = Group {
    content:[imgView, zoomCtrl, mapCtrl]
    effect:Reflection{fraction:0.75}
}


var stage = Stage {
	width: w
	height: h
        title:"Google Map"
	scene: Scene {
		fill:Color.BLACK
		content: [ctrl]
	}
}
