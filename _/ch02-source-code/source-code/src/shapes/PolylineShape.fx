package shapes;

import javafx.stage.Stage;  
import javafx.scene.Scene; 

import javafx.scene.shape.Polyline;


Stage {
	title: "Polyline Shape"
	width: 500
	height: 300
	x:100;
	y:200
	scene: Scene {
		content: [
			Polyline { 
				points: [
					 0.0,  0.0,
					20.0, 10.0,
					10.0, 20.0
				]
			}
		]
	}
}
