package custom;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.TextOrigin;
import javafx.scene.shape.Circle;
import javafx.scene.Group;
import javafx.scene.paint.Color;
import javafx.scene.input.MouseEvent;

class MessageButton extends CustomNode{
    public-init var message:String = "Hello!";
    public var xloc = 10;
    public var yloc = 10;
    public var size = 30;
    public var font:Font = Font{name:"Arial" size:12}


    override protected function create () : Node {
         def circle = Circle {
            centerX: bind xloc;
            centerY: bind yloc;
            radius:  bind size/2;
        }

        def text:Text = Text{
            font:font
            content:message
            textOrigin:TextOrigin.TOP
            wrappingWidth: bind size;
            fill:Color.WHITE
        };

        text.x = xloc - (text.boundsInLocal.width/2);
        text.y = yloc - (text.boundsInLocal.height/2);
        Group{
            content:[circle,text]
            onMouseEntered:function(e:MouseEvent){
                circle.scaleX = 1.25;
                circle.scaleY = 1.25;
            }
            onMouseExited:function(e:MouseEvent){
                circle.scaleX = 1.0;
                circle.scaleY = 1.0;
            }

        }

    }
}

Stage {
    title: "Message Buttons"
    width: 400
    height: 200
    x: 100;
    y: 200
    scene: Scene {
        content: [
            MessageButton {xloc:100 yloc:100 size:50 message:"Hello, World!"}
            MessageButton {xloc:200 yloc:100 size:100 message:"We've Made It!"}
        ]
    }
}
