package animation;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.input.MouseEvent;
import javafx.scene.shape.Rectangle;
import javafx.scene.shape.Circle;
import javafx.animation.Timeline;
import javafx.animation.Interpolator;

var ballX = 320.0;
var ballY = 100.0;
var paddleLeft = 270.0;
var paddleTop  = 400.0;
var clickX = 0.0;

var ball = Circle {	
	centerX: bind ballX
	centerY: bind ballY
	radius:25
}

var paddle = Rectangle {
	width: 100
	height: 25
	x:bind paddleLeft 
	y:bind paddleTop
	
	onMousePressed:function(e:MouseEvent):Void {
		clickX = e.x - paddleLeft
	}
	onMouseDragged:function(e:MouseEvent):Void {
		paddleLeft = e.x - clickX ;
	}
}

var anim = Timeline {
	autoReverse:true
	repeatCount:Timeline.INDEFINITE
	
	keyFrames:[
		at(0.9s) {ballX => paddleLeft + 50 tween Interpolator.EASEIN}
		at(0.9s) {ballY => paddleTop - 25  tween Interpolator.EASEIN}
	]
}

anim.play();

Stage {
	title: "Paddle"
	width: 640
	height:480
	scene: Scene {
		content : [
			ball, paddle
		]
	}
}
