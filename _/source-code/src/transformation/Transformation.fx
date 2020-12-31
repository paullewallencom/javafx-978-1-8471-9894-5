package transformation;

import javafx.stage.Stage;
import javafx.scene.Scene;


import javafx.scene.shape.Circle;
import javafx.scene.shape.Line;
import javafx.scene.shape.Rectangle;
import javafx.scene.control.Button;
import javafx.scene.transform.Rotate;
import javafx.scene.transform.Scale;
import javafx.scene.transform.Shear;
import javafx.scene.transform.Translate;

import javafx.scene.paint.Color;

import javafx.scene.input.MouseEvent;


var circle = Circle {radius:25 fill:Color.DARKBLUE}

var ang = 0;
var rect:Rectangle = Rectangle {
	transforms:[Translate {x:270,y:210}, Scale{x:2, y:2} Shear { x: -0.35 y: 0.45 } Rotate{angle: bind ang}] 
	width:50, height:30 
	fill:Color.RED
	
	onMouseEntered: function(e:MouseEvent):Void {
		if (rect.hover){
			ang = ang - 45;
		}
	}
}

var btn = Button {
	text: "Anim!"
	action:function():Void {
	}
}

Stage {
	title: "Transformation"
	width: 640
	height:480
	scene: Scene {
		content : [
			rect,
			Circle {centerX:270, centerY:210, radius:5}
			Circle {centerX:200, centerY:100, radius:25, transforms:[Shear { x: -0.35 y: 0 }]}
			Rectangle {width:100 height:50 translateX:300 translateY:50}
			Line {startX: 400 startY: 200 endX: 500 endY: 200 rotate:bind ang}
		]
	}
}
