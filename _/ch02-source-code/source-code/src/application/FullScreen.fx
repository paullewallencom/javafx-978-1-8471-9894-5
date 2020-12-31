
package application;
import javafx.stage.Stage;
import javafx.stage.StageStyle;
import javafx.scene.Scene;
import javafx.stage.Alert;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Text;

Stage {
	title : "Going Full Screen"
	width: 300
	height: 200
	fullScreen:true
	opacity:0.0
	scene: Scene {
		content: [
			Rectangle { 
				x: 100 y: 50
				width: 100 height: 100
				arcWidth: 10
				arcHeight : 10
				fill: Color.RED
            },
            Text {
            	content: "Full\nScreen"
            	x:110 y:60
            	fill: Color.WHITE
            	font:Font {size: 16}
            }
		]
	}
	onClose: function():Void {
		Alert.inform("You are about to quit the application.");
	}
}
