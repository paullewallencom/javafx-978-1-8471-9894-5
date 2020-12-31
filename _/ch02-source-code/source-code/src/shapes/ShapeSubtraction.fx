package shapes;

import javafx.scene.shape.Circle;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.shape.ShapeSubtract;
import javafx.scene.shape.Arc;

def w = 400;
def h = 200;

def c1 = Circle {
	centerX: 200, centerY: 100
	radius: 50
}

def c2 = Circle {
	centerX: 150, centerY: 50
	radius: 35
}

def c3 = Circle {
	centerX: 250, centerY: 50
	radius: 35
}

def c4 = Circle {
	centerX: 200, centerY: 105
	radius: 5
}

def c5 = Circle {
	centerX: 150, centerY: 50
	radius: 20
}
def c6 = Circle {
	centerX: 250, centerY: 50
	radius: 20
}





Stage {
	title : "Shape Combination"
	scene: Scene {
		width: w
		height: h
                fill:Color.YELLOW
		content:[
                    ShapeSubtract {
                        a: [c1,c2,c3] b:[c4,c5,c6]
                        
                    }
                ]
	}
}
