package controls;

import javafx.scene.layout.VBox;
import javafx.scene.Group;
import javafx.scene.layout.HBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextBox;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.control.ToggleGroup;
import javafx.scene.control.RadioButton;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.geometry.HPos;
import javafx.geometry.VPos;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.animation.transition.TranslateTransition;

def w = 400;
def h = 200;
var scene:Scene;

def rdoBtns = ToggleGroup{};
var nameRow = HBox {
    spacing:7
    content:[
        VBox{content:[Label{text:"First Name"},TextBox{id:"fName"}]}
        VBox{content:[Label{text:"Last Name"},TextBox{id:"lName"}]}
    ]
}

var addr1Row = HBox {
     spacing:7
     content:[
        VBox{content:[Label{text:"Address"},TextBox{id:"addr"}]}
        VBox{content:[Label{text:"Suite"},TextBox{id:"suite"}]}
    ]
}

var addr2Row =  HBox {
     spacing:7
    content:[
        VBox{content:[Label{text:"City"},TextBox{id:"city"}]}
        VBox{content:[Label{text:"Postal Code"},TextBox{id:"pcode"}]}
    ]
}

var titleRow = HBox {
     spacing:7
    content:[
        HBox{
            nodeVPos:VPos.CENTER
            spacing:7
            content:[Label{text:"Title:"}
                    RadioButton{text:"Programmer" toggleGroup:rdoBtns id:"pgmr"}
                    RadioButton{text:"Manager" toggleGroup:rdoBtns id:"mngr"}
                    RadioButton{text:"Janitor" toggleGroup:rdoBtns id:"gntr"}
            ]
        }
    ]
}

var attndRow = HBox {
    spacing:7
    nodeVPos:VPos.CENTER
    content:[CheckBox{id:"isattnd" text:"Mark as Attendee"}]
}

var btnRow = HBox {
    spacing:7
    content:[
        Button{
            text:"Submit"
            action:function(){
                moveIn.playFromStart();
            }
        }
        Button{text:"Clear"}
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
                Label{textFill:Color.WHITE text: bind "First Name: {(scene.lookup("fName") as TextBox).text}"}
                Label{textFill:Color.WHITE text: bind "Last Name: {(scene.lookup("lName") as TextBox).text}"}
                Label{textFill:Color.WHITE text: bind "Address: {(scene.lookup("addr") as TextBox).text}"}
                Label{textFill:Color.WHITE text: bind "Suite: {(scene.lookup("suite") as TextBox).text}"}
                Label{textFill:Color.WHITE text: bind "City: {(scene.lookup("city") as TextBox).text}"}
                Label{textFill:Color.WHITE text: bind "Postal Code: {(scene.lookup("pcode") as TextBox).text}"}
                Label{textFill:Color.WHITE text: bind "Position: {rdoBtns.selectedButton.text}"}
                Label{textFill:Color.WHITE text: bind "Attendee: {(scene.lookup("isattnd") as CheckBox).selected}"}
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
	title : "Data Input Form"
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

