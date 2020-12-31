package async;

import javafx.stage.Stage;  
import javafx.scene.Scene;

import javafx.async.Task;

import javafx.scene.layout.HBox;
import javafx.geometry.HPos;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.scene.shape.Circle;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.scene.input.MouseEvent;


var statusText:String;

class LongRunningTask extends Task {
	override function start():Void {
		onStart();
		for(i in [0..1000]) {
			for(j in [0..1000])
				for(k in [0..1000])
			progress = k;
		}
		onDone();
	}
	override function stop():Void {
		statusText = "Process stopped!";
	}
}

var task = LongRunningTask{
	onStart: function():Void {
		statusText = "Long running task started.";
	},
	onDone: function ():Void {
		statusText = "Long Running Task Done";
	}
}


var status = Text {
	content: bind statusText;
	fill: Color.BLUE
	font:Font {size: 12}
}

Stage {
	title: "Simple Shapes!"
	width: 500
	height: 300
	x:100;
	y:200
	scene: Scene {
		content: VBox{
			width:500
			height:300
			spacing: 5
			hpos:HPos.CENTER
			content: [
				HBox {
					content: [
						Circle {
							radius:25
							fill:Color.SILVER
							onMouseClicked:function(e:MouseEvent):Void {
								FX.deferAction(function() {
									task.start();
                                                                        println ("task started");
								});
							}
						},
						Rectangle {
							width:75
							height:50
							arcHeight:10, 
							arcWidth:10
							fill:Color.BLUE
							onMouseClicked:function(e:MouseEvent):Void {
								task.stop();
                                                                println ("task stopped");
							}
						}
					]
				},
				HBox {content:status},
			]
		}
	}
}
