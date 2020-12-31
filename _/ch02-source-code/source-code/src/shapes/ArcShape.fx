package shapes;

import javafx.stage.Stage;  
import javafx.scene.Scene; 

import javafx.scene.shape.Arc;
import javafx.scene.shape.ArcType;


Stage {
	title: "Simple Shapes!"
	width: 500
	height: 300
	x:100;
	y:200
	scene: Scene {
		content: [
			
			Arc { 
				centerX: 300  centerY: 50
				radiusX: 50
				radiusY: 50
				startAngle: 45  
				length: 270
				type: ArcType.ROUND
			}
		]
	}
}
