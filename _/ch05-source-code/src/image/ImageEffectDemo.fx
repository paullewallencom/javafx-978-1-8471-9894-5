package image;

import javafx.scene.Scene;

import javafx.stage.Stage;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import java.lang.Math;
import javafx.scene.layout.HBox;
import javafx.scene.effect.FloatMap;
import javafx.scene.effect.DisplacementMap;
import javafx.scene.effect.GaussianBlur;
import javafx.scene.effect.Reflection;
import javafx.scene.effect.Glow;
import javafx.scene.effect.ColorAdjust;

var w = 640;
var h = 480;
var size = 100;

var source = Image {
   url:"{__DIR__}image.jpg"
   backgroundLoading:false
}
var source2 = Image {
	url:"{__DIR__}image2.jpg"
	backgroundLoading:false
}

var mapW = source.width as Integer;
var mapH = source.height as Integer;
var map = FloatMap { width: mapH + 200 height: mapH + 200 }

for (i:Integer in [0..w-1]) {
    var v = (Math.sin(i/50.0*Math.PI)-0.5)/40.0;
    for (j:Integer in [0..h-1]) {
        map.setSamples(i, j, 0.0, v);
    }
}

var image1 = ImageView {
	effect: DisplacementMap { mapData: map }
    fitWidth:size
    preserveRatio:true
    image:source
}

var image2 = ImageView {
	effect: GaussianBlur{radius:10}
    fitWidth:size
    preserveRatio:true
    image:source
}

var image3 = ImageView {
	effect: Glow{level:0.8}
    fitWidth:size
    preserveRatio:true
    image:source
}

var image4 = ImageView {
	effect: ColorAdjust{brightness:0.0 contrast:2.0 saturation:0.5}
    fitWidth:size
    preserveRatio:true
    image:source
}

var image5 = ImageView {
	effect: Reflection{}
    fitWidth:size
    preserveRatio:true
    image:source
}

var ctrl = HBox {
    content:[
        image2, image3, image4, image5
    ]
}

//ctrl.translateY = (h - ctrl.boundsInLocal.height)/2;

Stage {
	width: w
	height: h
	scene: Scene {
		content: [ctrl]
	}
}
