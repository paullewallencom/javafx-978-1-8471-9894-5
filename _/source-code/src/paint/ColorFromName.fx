package paint;

import javafx.scene.shape.Circle;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
import javafx.scene.Scene;

def w = 400;
def h = 200;

def circ0 = Circle {
    centerX: w/2 centerY:h/2 radius: 90 fill:Color.web("red");
}

Stage {
	title: "Color"
	width: w
	height:h
	scene: Scene {
		content : [circ0]
	}
}