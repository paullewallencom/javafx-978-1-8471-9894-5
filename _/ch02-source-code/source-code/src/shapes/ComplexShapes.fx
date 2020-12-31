package shapes;

import javafx.stage.Stage;  
import javafx.scene.Scene; 

import javafx.scene.shape.Path;
import javafx.scene.shape.MoveTo;
import javafx.scene.shape.HLineTo;
import javafx.scene.shape.QuadCurveTo;
import javafx.scene.shape.LineTo;
import  javafx.scene.shape.ArcTo;
import javafx.scene.shape.CubicCurve;
import javafx.scene.shape.QuadCurve;


Stage {
	title: "Simple Shapes!"
	width: 500
	height: 300
	x:100;
	y:200
	scene: Scene {
		content: [
			CubicCurve {
				   startX:   0     startY:  50
				controlX1:  25  controlY1:   0
				controlX2:  75  controlY2: 100
					 endX: 100       endY:  50
			},
			QuadCurve { startX: 120  startY: 120  controlX: 100  controlY: 0 },
			Path {
				elements: [
					MoveTo { x: 10  y: 50 },
					HLineTo { x: 70 },
					QuadCurveTo { x: 120  y: 60  controlX: 100  controlY: 0 },
					LineTo { x: 175  y: 55 },
					ArcTo { x: 10  y: 50  radiusX: 100  radiusY: 100  sweepFlag: true },
				]
			}
		]
	}
}
