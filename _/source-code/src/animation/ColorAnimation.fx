package animation;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.animation.Timeline;
import javafx.scene.shape.Circle;

var r = 0;
var g = 0;
var b = 0;
var color = bind Color.rgb(r, g, b);

def w = 400;
def h = 200;
def rad = 20;

def bubbles =
for(y in [0 .. h / (rad*2) ]) {
    for (x in [0..w/(rad*2)]){
        Circle {
            radius: rad
            fill: bind color
            centerX: x * 2 * rad
            centerY: y * 2 * rad
            cache:true
        }
    }
}


Timeline {
    autoReverse:true
    repeatCount:Timeline.INDEFINITE
    keyFrames:[at(5s) {r => 255}]
}.play();

Stage {
	title: "Circlz"
	width: w
	height:h
	scene: Scene {
		content : bind bubbles
	}
}
