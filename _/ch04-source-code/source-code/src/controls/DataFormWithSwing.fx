package controls;

import javafx.scene.layout.VBox;
import javafx.scene.Group;
import javafx.scene.layout.HBox;
import javafx.scene.control.Label;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.geometry.HPos;
import javafx.geometry.VPos;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.animation.transition.TranslateTransition;
import javafx.ext.swing.SwingLabel;
import javafx.ext.swing.SwingTextField;
import javafx.ext.swing.SwingToggleGroup;
import javafx.ext.swing.SwingRadioButton;
import javafx.ext.swing.SwingCheckBox;
import javafx.ext.swing.SwingButton;

def w = 400;
def h = 225;
var scene:Scene;

def rdoBtns = SwingToggleGroup{};
var nameRow = HBox {
    spacing:3
    content:[
        VBox{content:[SwingLabel{text:"First Name"},SwingTextField{id:"fName" columns:10}]}
        VBox{content:[SwingLabel{text:"Last Name"},SwingTextField{id:"lName" columns:10}]}
    ]
}

var addr1Row = HBox {
     spacing:3
     content:[
        VBox{content:[SwingLabel{text:"Address"},SwingTextField{id:"addr" columns:10}]}
        VBox{content:[SwingLabel{text:"Suite"},SwingTextField{id:"suite" columns:10}]}
    ]
}

var addr2Row =  HBox {
     spacing:3
    content:[
        VBox{content:[SwingLabel{text:"City"},SwingTextField{id:"city" columns:10}]}
        VBox{content:[SwingLabel{text:"Postal Code"},SwingTextField{id:"pcode" columns:10}]}
    ]
}

var titleRow = HBox {
     spacing:3
    content:[
        HBox{
            nodeVPos:VPos.CENTER
            spacing:7
            content:[SwingLabel{text:"Title:"}
                    SwingRadioButton{text:"Programmer" toggleGroup:rdoBtns id:"pgmr"}
                    SwingRadioButton{text:"Manager" toggleGroup:rdoBtns id:"mngr"}
                    SwingRadioButton{text:"Janitor" toggleGroup:rdoBtns id:"gntr"}
            ]
        }
    ]
}

var attndRow = HBox {
    spacing:3
    nodeVPos:VPos.CENTER
    content:[SwingCheckBox{id:"isattnd" text:"Mark as Attendee"}]
}

var btnRow = HBox {
    spacing:7
    content:[
        SwingButton{
            text:"Submit"
            action:function(){
                moveIn.playFromStart();
            }
        }
        SwingButton{text:"Clear"}
    ]
}

// form panel
def panel = VBox {
    spacing:5
    content: [nameRow, addr1Row, addr2Row, titleRow, attndRow, btnRow]
}

// Summary Form Data
var formDataX = (w - (w-30))/2;
var formDataY = (h - (h-30))/2;
var formData:Group = Group {
    layoutX: formDataX
    layoutY: formDataY
    content:[
        Rectangle {
            width: w - 30 height: h - 30
            fill:Color.BLACK
            stroke:Color.BLUE
            strokeWidth:3
            opacity:0.65
            arcHeight:10 arcWidth:10
        }
        VBox {
            width:w-30 height:h-30
            hpos:HPos.CENTER
            content:[
                Label{textFill:Color.WHITE text: bind "First Name: {(scene.lookup("fName") as SwingTextField).text}"}
                Label{textFill:Color.WHITE text: bind "Last Name: {(scene.lookup("lName") as SwingTextField).text}"}
                Label{textFill:Color.WHITE text: bind "Address: {(scene.lookup("addr") as SwingTextField).text}"}
                Label{textFill:Color.WHITE text: bind "Suite: {(scene.lookup("suite") as SwingTextField).text}"}
                Label{textFill:Color.WHITE text: bind "City: {(scene.lookup("city") as SwingTextField).text}"}
                Label{textFill:Color.WHITE text: bind "Postal Code: {(scene.lookup("pcode") as SwingTextField).text}"}
                Label{textFill:Color.WHITE text: bind "Position: {rdoBtns.getSelection().text}"}
                Label{textFill:Color.WHITE text: bind "Attendee: {(scene.lookup("isattnd") as SwingCheckBox).selected}"}
            ]
        }
    ]
    onMousePressed:function(e){
        moveOut.playFromStart();
    }
}


// panel animation
var moveIn:TranslateTransition = TranslateTransition {toY:formDataY-15 duration:1s node:formData}
var moveOut:TranslateTransition = TranslateTransition {toY:formDataY - 500 duration:1s node:formData}
moveOut.play();

// stage
Stage {
	title : "Swing Data Input Form"
	scene: scene = Scene {
                fill:LinearGradient {
                    startX: 0, endX: 0, startY: 0, endY: 1
                    stops: [
                        Stop { offset: 0, color: Color.LIGHTGRAY }
                        Stop { offset: 1, color: Color.WHITESMOKE }
                    ]
                }
		width: w
		height: h
		content: [Group{ layoutX:10 content:panel}, formData ]
	}
}
