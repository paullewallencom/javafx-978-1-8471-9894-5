package effects;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.paint.RadialGradient;
import javafx.scene.shape.Circle;

def w = 400;
def h = 200;

def linearGrad = LinearGradient {
    startX: 0.0, startY: 0.0, endX: 0.0, endY: 1.0
    proportional: true
    stops: [ 
    	Stop {offset: 0.0 color: Color.RED},
        Stop {offset: 1.0 color: Color.BLACK},
    ]
}

def radialGrad = RadialGradient{
    radius:1; centerX: 0.5, centerY: 0.5
    proportional: true
    stops: [ 
    	Stop {offset: 0.0 color: Color.BLACK},
        Stop {offset: 1.0 color: Color.WHITE},
    ]        
}

def circ0 = Circle {
    centerX: w/2 centerY:h/2 radius: 90 fill:radialGrad
}

def rec0 = Rectangle {
    width: 100 height: 90
    x: 30 y: h - 90
    fill: linearGrad
    stroke:Color.SILVER
}


Stage {
	title: "Gradients"
	width: w
	height:h
	scene: Scene {
		content : [circ0,rec0]
	}
}
