package animation;

import javafx.scene.shape.Circle;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.input.MouseEvent;
import javafx.util.Math;
import javafx.scene.paint.Color;
import java.util.Random;
import javafx.animation.Timeline;
import javafx.animation.Interpolator;

def w = 400;
def h = 200;
def margin = 5;
def mScale = 2;

var cw = 50;
var sScale = 1.0;

var circles = for(i in [0..w/(cw/2)]) Circle{radius: bind cw/2}
var index = 0;
for(circle in circles){
    def c = circle;
    c.centerX = index * (cw + margin) ;
    c.centerY = h/2 - cw/2;
    c.fill = getRandColor();
    c.stroke = getRandColor();
    c.strokeWidth = 3;
                       
    c.onMouseMoved = function(e:MouseEvent){
        var scale = mScale - Math.abs(e.x - c.centerX)/(cw);
        c.scaleX = scale;
        c.scaleY = scale;
    }
    c.onMouseEntered = function(e:MouseEvent){
        var scale = mScale - Math.abs(e.x - c.centerX)/(cw/2);
        c.toFront();
        c.opacity= 0.5;
    }

    c.onMouseExited = function(e:MouseEvent){
        Timeline {
            interpolate:true
            keyFrames:[at(0.5s){c.scaleX => 1.0; c.scaleY => 1.0}]
        }.play();
        
        c.opacity = 1.0;
        c.toBack();
    }

    index++;
}

function getRandColor():Color {
    Color.rgb(new Random().nextInt(255),
                       new Random().nextInt(255),
                       new Random().nextInt(255));
}



Stage {
	title : "FishEyz"
	scene: Scene {
		width: w
		height: h
		content: circles
	}
}
