package http;
import javafx.data.Pair;
import javafx.io.http.HttpRequest;
import javafx.io.http.URLConverter;
import java.io.OutputStream;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextBox;
import javafx.scene.control.Button;
import javafx.scene.Group;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.Color;
import javafx.scene.Scene;
import javafx.geometry.HPos;
import javafx.stage.Stage;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;


def w = 400;
def h = 200;
var scene:Scene;

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
        VBox{content:[Label{text:"Title"},TextBox{id:"title"}]}
    ]
}

var btnRow = HBox {
    spacing:7
    content:[
        Button{
            text:"Submit"
            action:function(){
                formData.visible = true;
                postData();
            }
        }
    ]
}

def dataW = w-30;
def dataH = h-100;
var formData:Group = Group {
    visible:false
    layoutX: (w - dataW)/2;
    layoutY: 20
    content:[
        Rectangle {
            width: dataW height: dataH
            fill:Color.BLACK
            stroke:Color.BLUE
            strokeWidth:3
            opacity:0.65
            arcHeight:10 arcWidth:10
        }
        VBox {
            width:w-30 height:100
            hpos:HPos.CENTER
            content:[
                Label{textFill:Color.WHITE text: "Data Submitted"}
                Label{textFill:Color.WHITE text: bind "First Name: {(scene.lookup("fName") as TextBox).text}"}
                Label{textFill:Color.WHITE text: bind "Last Name: {(scene.lookup("lName") as TextBox).text}"}
                Label{textFill:Color.WHITE text: bind "Address: {(scene.lookup("addr") as TextBox).text}"}
                Label{textFill:Color.WHITE text: bind "Title: {(scene.lookup("title") as TextBox).text}"}
            ]
        }
    ]
    onMousePressed:function(e){
        formData.visible = false;
    }
}

// form panel
def panel = VBox {
    spacing:5
    content: [nameRow, addr1Row,btnRow]
}

function postData(){
    var conv = URLConverter{};
    var url = "http://localhost:8080/webapp/employee/save";
    var postData = [
        Pair{name:"firstName" value:(scene.lookup("fName") as TextBox).text},
        Pair{name:"lastName" value:{(scene.lookup("lName") as TextBox).text}},
        Pair{name:"title" value:(scene.lookup("title") as TextBox).text},
        Pair{name:"address" value:(scene.lookup("addr") as TextBox).text},
    ];

    var http = HttpRequest {
        location: url
        method: HttpRequest.POST

        onOutput:function (toServer: OutputStream){
            try {
                var data = conv.encodeParameters(postData);
                toServer.write(data.getBytes());
            }finally{
                toServer.close();
            }
        }

        onToWrite: function(bytes: Long) { println("Length of Content to write: {bytes}") }
        onWritten: function(bytes: Long) { println("Total bytes written {bytes}") }
        onDoneWrite: function() { println("Finished writing to server") }

        onResponseCode:function (code:Integer) {
            println ("Done: response code {code}")
        }

        onException: function(ex: java.lang.Exception) {
            println("Error: {ex.getMessage()}");
        }
    }

    http.start();
}

Stage {
	title : "Http POST"
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