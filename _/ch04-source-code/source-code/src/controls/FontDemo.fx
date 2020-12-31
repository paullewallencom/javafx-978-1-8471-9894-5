package controls;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;
import javafx.scene.text.Font;

def w = 400;
def h = 200;

def txt = Text {
	content: "Hello, this is a text"
	font: Font {
		size:26.0 
		name:"Verdana"
		embolden:true 
	}
	stroke: Color.BLUE;
	strokeWidth:3
}
txt.translateX = (w - txt.layoutBounds.width)/2;
txt.translateY = (h - txt.layoutBounds.height)/ 2;

Stage {
	width: w
	height: h
	scene: Scene {
		content: [txt]
	}
}
