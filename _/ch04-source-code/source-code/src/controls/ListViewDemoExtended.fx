package controls;

import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.scene.shape.Rectangle;
import javafx.scene.control.ListView;
import javafx.scene.effect.DropShadow;
import javafx.scene.shape.Shape;
import java.util.Random;
import javafx.scene.shape.Circle;
import javafx.scene.shape.Line;
import javafx.scene.layout.HBox;
import javafx.scene.control.Label;
import javafx.geometry.HPos;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.paint.Color;

var w = 400;
var h = 350;
var scene:Scene;

class MyItem {
    public var id:Integer = new Random().nextInt(100);
    public var name:String;
    public var shape:Shape;
    override function toString():String {
        "Shape: {%5s name}"
    }
}

var listView = ListView {
	width:200
	height:150
	effect:DropShadow{offsetY:3 offsetX:3}
	items:  [
            MyItem{id:1 name:"Rectangle" shape:Rectangle{width:100 height:50}}
            MyItem{id:2 name:"Circle" shape:Circle{radius:25}}
            MyItem{id:3 name:"Line" shape:Line{startX:10 startY:10 endX:40 endY:50}}
            MyItem{id:4 name:"Round Rectangle" shape:Rectangle{width:100 height:50 arcHeight:10 arcWidth:10}}
        ]
}

var itemPanel = HBox{
    spacing:5
    translateY:h-100
    width:w
    hpos:HPos.CENTER
}

listView.layoutX = (w-listView.width)/2;
listView.layoutY= 10;

listView.onMouseClicked = function(e) {
    var item = listView.selectedItem as MyItem;
    itemPanel.content = [item.shape, Label{text:"You selected item {item.name}"}]
}

Stage {
	width: w
	height: h
	scene: scene = Scene {
                fill:LinearGradient {
                    startX: 0, endX: 0, startY: 0, endY: 1
                    stops: [
                        Stop { offset: 0, color: Color.GRAY }
                        Stop { offset: 1, color: Color.WHITESMOKE }
                    ]
                }
		content: [listView, itemPanel]
	}
}
