package styling;

import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;
import javafx.scene.shape.Line;
import javafx.scene.shape.Rectangle;
import javafx.scene.shape.Circle;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.geometry.HPos;
import javafx.geometry.VPos;

def w = 400;
def h = 200;

def panel = VBox {
    width:w height:h
    nodeHPos:HPos.CENTER
    spacing:10
    content:[
         Text{content:"External CSS" id:"titleText"}
         HBox{
             width:w height:h
             nodeVPos:VPos.CENTER
             spacing:5
             content:[
                 Circle{radius:50}
                 Rectangle{width:100 height:70 styleClass:"broad"}
                 Line{startX:0 endX:100 styleClass:"broad"}
             ]}
         Text{content:"Pay Attention!"  styleClass:"specialText"}
         Text{content:"All objects styled with CSS"}
    ]
}

Stage {
	title : "External CSS Example"
	scene: Scene {
	    width: w
	    height: h
            content: [ panel ]
            stylesheets:["{__DIR__}main.css"]
	}
}
