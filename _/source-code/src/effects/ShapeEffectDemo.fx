package effects;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.shape.Circle;
import javafx.scene.paint.Color;
import javafx.scene.effect.Lighting;
import javafx.scene.effect.DropShadow;
import javafx.scene.effect.light.DistantLight;
import javafx.scene.shape.Rectangle;

def w = 400;
def h = 200;


def shadow = DropShadow { offsetX:5 offsetY:5 }

def light = Lighting {
	light:DistantLight{azimuth:-45}
	surfaceScale:5
}

def circ = Circle {
    centerX: 125 centerY: 100 radius:50
    fill:Color.RED  stroke:Color.BLUE
    effect: light
}

def rect = Rectangle {
    x:200 y:50 width:125 height:100
    fill:Color.BLUE
    arcHeight:10 arcWidth:10
    effect:shadow
}


Stage {
	title: "Lighting/Shadow Effects"
	width: w
	height:h
	scene: Scene {
		content : [
			circ,rect
		]
	}
}
