package shapes;

import javafx.scene.paint.Color;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.shape.Arc;
import javafx.scene.shape.Circle;
import javafx.scene.shape.ShapeSubtract;
import javafx.scene.shape.Rectangle;


def w = 400;
def h = 200;

def a1 = Arc {
    centerX:200
    centerY:149
    radiusX:100
    radiusY:100
    startAngle:0 length:180
    fill:Color.BISQUE
}

def c1 = Circle {centerX: 175, centerY:28 radius:25 fill:Color.SILVER}
def c2 = Circle {centerX: 225, centerY:28 radius:25 fill:Color.SILVER}

def c3 = Circle {centerX: 125, centerY:149 radius:15}
def c4 = Circle {centerX: 150 + 10, centerY:149 radius:15}
def c5 = Circle {centerX: 175 + 20 , centerY:149 radius:15}
def c6 = Circle {centerX: 200 + 30 , centerY:149 radius:15}
def c7 = Circle {centerX: 225 + 40 , centerY:149 radius:15}

def r1 = Rectangle {x:175 y :25 width:50  height:29}

Stage {
	title : "Shape Combination"
	scene: Scene {
		width: w
		height: h
                fill:Color.RED
		content:[
                    ShapeSubtract {a:[r1] b:[c1,c2] fill:Color.BISQUE}
                    ShapeSubtract{
                        a:a1
                        b:[for(i in [0..3]){
                            Circle {centerX: 125 + (i*50), centerY:149 radius:17}
                        }]
                        fill:Color.BISQUE
                    }
                ]
	}
}
