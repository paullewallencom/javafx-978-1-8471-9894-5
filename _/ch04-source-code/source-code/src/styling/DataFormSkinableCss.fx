package styling;

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
import javafx.geometry.VPos;
import javafx.scene.text.Text;

def w = 400;
def h = 250;
var scene:Scene;
var cssFile = "bluemoon.css";

def rdoBtns = ToggleGroup{};

def heading = Text{content:"Employee Information" styleClass:"heading"}

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
            text:"Bluemoon.css"
            action:function(){
                cssFile = "bluemoon.css"
            }
        }
        Button{text:"Autumn.css"
            action:function(){
                cssFile = "autumn.css";
            }
        }
    ]
}

// form panel
def panel = VBox {
    spacing:5
    content: [heading, nameRow, addr1Row, addr2Row, titleRow, attndRow, btnRow]
}

// stage
Stage {
	title : "Skinnable Data Input Form"
	scene: scene = Scene {
		width: w
		height: h
		content: [Group{ layoutX:10 content:panel}]
                stylesheets: bind ["{__DIR__}{cssFile}"]
	}
}
