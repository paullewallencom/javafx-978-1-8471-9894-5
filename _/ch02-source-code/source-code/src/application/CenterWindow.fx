
package application;
import javafx.stage.Stage;  
import javafx.stage.Screen;
import javafx.scene.Scene; 
import javafx.stage.Alert;

import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Text;

def screenWidth = Screen.primary.bounds.width;
def screenHeight= Screen.primary.bounds.height;

def winWidth  = 500;
def winHeight = 300;
def centerX   = (screenWidth/2)  - (winWidth/2);
def centerY   = (screenHeight/2) - (winHeight/2);

Stage {
	title: "Centered!"
	width: winWidth
	height: winHeight
	opacity:1.0
	x:centerX
	y:centerY
	
	onClose: function():Void {
		Alert.inform("You are about to quit the application.");
	}

	scene: Scene {
		content: [
			Rectangle { 
				x: (winWidth/2)-50 
				y: (winHeight/2)-50
				width: 100 
				height: 100
				arcWidth: 10
				arcHeight : 10
				fill: Color.RED
            },
            Text {
            	content: "Box"
            	x:(winWidth/2)-50
            	y:(winHeight/2)-40
            	fill: Color.WHITE
            	font:Font {size: 16}
            }
		]
	}
}
