package controls;

import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.scene.text.Font;
import javafx.scene.control.TextBox;
import javafx.scene.effect.DropShadow;

var w = 640;
var h = 480;

var ti:TextBox = TextBox {
	columns:40
	promptText:"What's on your mind?"
	font: Font {name:"Arial Black" size:18}
	effect:DropShadow{offsetY:3 offsetX:3}
	action:function():Void {
		println ("Text Saved");
	}
}

ti.translateX = (w - ti.boundsInLocal.width)/2;
ti.translateY = (h - ti.boundsInLocal.height)/2;



Stage {
	width: w
	height: h
	scene: Scene {
		content: [ti]
	}
}
