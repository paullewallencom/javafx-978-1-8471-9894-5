package controls;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.stage.Alert;
import javafx.scene.text.Font;
import javafx.scene.effect.DropShadow;
import javafx.ext.swing.SwingButton;

def w = 400;
def h = 200;

def btn = SwingButton {
	text:"Click me, I am a Button"
	font: Font {name:"Arial Black" size:18}
	effect:DropShadow{offsetY:3 offsetX:3}
	action:function():Void {
		var answer = Alert.question("Georgia");
		if(answer){
			Alert.inform("Me too!");
		}else{
			Alert.inform("Too bad.");
		}
		
	}
}

btn.translateX = (w - btn.layoutBounds.width)/2;
btn.translateY = (h - btn.layoutBounds.height)/2;



Stage {
	width: w
	height: h
	scene: Scene {
		content: [btn]
	}
}
