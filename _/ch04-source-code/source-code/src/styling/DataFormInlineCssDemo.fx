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
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;

def w = 400;
def h = 250;
var scene:Scene;

def rdoBtns = ToggleGroup{};

def heading = Text{
    content:"Employee Information"
    style:"font-family:\"Helvetica\";"
          "font-size:24pt;"
          "font-weight:bold;"
}


def nameRow = HBox {
    spacing:7
    content:[
        VBox{content:[
            Label{text:"First Name" style:"textFill:blue"},
            TextBox{
                id:"fName" 
                style:"textFill:yellow; "
                      "backgroundFill:lightblue;"
                      "borderFill:lightblue"
            }
        ]}
        VBox{content:[
            Label{text:"Last Name" style:"textFill:blue"},
            TextBox{
                id:"lName" 
                style:"textFill:yellow;"
                      "backgroundFill:lightblue;"
                      "borderFill:lightblue;"
             }
        ]}
    ]
}

def addr1Row = HBox {
     spacing:7
     content:[
        VBox{content:[
            Label{text:"Address" style:"textFill:blue"},
            TextBox{id:"addr" style:"textFill:yellow; backgroundFill:lightblue; borderFill:lightblue;"}
         ]}
        VBox{content:[
            Label{text:"Suite" style:"textFill:blue"},
            TextBox{id:"suite" style:"textFill:yellow; backgroundFill:lightblue; borderFill:lightblue;"}
        ]}
    ]
}

def addr2Row =  HBox {
     spacing:7
    content:[
        VBox{content:[
            Label{text:"City" style:"textFill:blue"},
            TextBox{id:"city" style:"textFill:yellow; backgroundFill:lightblue; borderFill:lightblue;"}
        ]}
        VBox{content:[
            Label{text:"Postal Code" style:"textFill:blue"},
            TextBox{id:"pcode" style:"textFill:yellow; backgroundFill:lightblue; borderFill:lightblue;"}
        ]}
    ]
}

def titleRow = HBox {
     spacing:7
    content:[
        HBox{
            nodeVPos:VPos.CENTER
            spacing:7
            content:[Label{text:"Title:" style:"textFill:blue"}
                    RadioButton{text:"Programmer" toggleGroup:rdoBtns id:"pgmr" style:"fill:lightblue"}
                    RadioButton{text:"Manager" toggleGroup:rdoBtns id:"mngr" style:"fill:lightblue"}
                    RadioButton{text:"Janitor" toggleGroup:rdoBtns id:"gntr" style:"fill:lightblue"}
            ]
        }
    ]
}

def attndRow = HBox {
    spacing:7
    nodeVPos:VPos.CENTER
    content:[CheckBox{id:"isattnd" text:"Mark as Attendee" style:"textFill:blue;fill:lightblue;"}]
}

def btnRow = HBox {
    spacing:7
    content:[
        Button{
            text:"Submit"
            action:function(){
                //moveIn.playFromStart();
            }
            style:"textFill:blue;fill:lightblue"
        }
        Button{text:"Clear" style:"textFill:blue;fill:lightblue"}
    ]
}

// form panel
def panel = VBox {
    spacing:5
    content: [heading, nameRow, addr1Row, addr2Row, titleRow, attndRow, btnRow]
}



// stage
Stage {
	title : "Data Input Form"
	scene: scene = Scene {
                fill:LinearGradient {
                    startX: 0, endX: 0, startY: 0, endY: 1
                    stops: [
                        Stop { offset: 0, color: Color.SILVER }
                        Stop { offset: 1, color: Color.WHITESMOKE }
                    ]
                }
		width: w
		height: h
		content: [Group{ layoutX:10 content:panel}]
	}
}