package controls;

import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.scene.shape.Circle;
import javafx.scene.paint.Color;
import javafx.scene.control.Slider;
import javafx.scene.effect.DropShadow;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.geometry.VPos;
import javafx.scene.text.Text;
import javafx.geometry.HPos;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;

var w = 400;
var h = 200;

var rSlide = Slider {translateX:10 translateY:20 min:0 max:255 value:0}
var gSlide = Slider {translateX:10 translateY:40 min:0 max:255 value:0}
var bSlide = Slider {translateX:10 translateY:60 min:0 max:255 value:0}

var circ = Circle {
    fill : bind Color.rgb(rSlide.value, gSlide.value, bSlide.value)
    stroke:Color.WHITE strokeWidth:3 radius: 70
    effect:DropShadow{offsetY:4 offsetX:4}
}

var panel = HBox{
    width:w
    spacing:20
    nodeVPos:VPos.TOP
    content:[
        VBox {content: [rSlide, gSlide, bSlide]},
         circ,
         VBox{
             spacing:20
             content:[
                 Text{content: bind "R: {%.0f rSlide.value}"}
                 Text{content: bind "G: {%.0f gSlide.value}"}
                 Text{content: bind "B: {%.0f bSlide.value}"}
             ]
         }

    ]
}


Stage {
	width: w
	height: h

	scene: Scene {
                fill:LinearGradient {
                    startX: 0, endX: 0, startY: 0, endY: 1
                    stops: [
                        Stop { offset: 0, color: Color.GRAY }
                        Stop { offset: 1, color: Color.WHITESMOKE }
                    ]
                }
		content: [panel]
	}
}
