
package application;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.stage.Alert;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Text;

Stage {
	title : "Simple JavaFX Application"
	width: 300
	height: 200	
	visible: true
	x: 600
	y: 400
	onClose: function():Void {
		Alert.inform("You are about to quit the application.");
	}
}
