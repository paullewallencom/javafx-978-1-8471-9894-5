package controls;

import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.scene.control.ProgressBar;
import javafx.animation.Timeline;
import javafx.animation.KeyFrame;
import javafx.scene.effect.DropShadow;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.scene.control.ProgressIndicator;

var w = 400;
var h = 200;
var total = 400;
var counter = 0;

def prog = ProgressIndicator {
   
    progress: bind ProgressBar.computeProgress(total, counter)
    effect:DropShadow{offsetY:3 offsetX:3}
    width: w - 100
}
prog.layoutX = (w - prog.layoutBounds.width)/2;
prog.layoutY = (h - prog.layoutBounds.height)/2;


def timer:Timeline = Timeline {
    repeatCount: Timeline.INDEFINITE
    interpolate:false
    keyFrames:[
        KeyFrame{time:100ms
            action:function():Void {
                if(counter <= total){
                    counter++;
                }else{
                    //counter = 0;
                    timer.stop();
                }
            }
        }
    ]
}

timer.play();

def progTxt:Text = Text {
    layoutX:(prog.width)/2
    layoutY:prog.layoutY - 30
    content: bind "Progress: {%.0f prog.progress*100}%"
    font:Font.font("Arial", FontWeight.BOLD, 22)
    fill:Color.BLUE
    opacity:0.25
}


Stage {
        title:"ProgressIndicator Control"
	width: w
	height: h
	scene: Scene {
            fill:LinearGradient {
                    startX: 0, endX: 0, startY: 0, endY: 1
                    stops: [
                        Stop { offset: 0, color: Color.GRAY }
                        Stop { offset: 1, color: Color.WHITESMOKE }
                    ]
                }
            content: [prog, progTxt]
	}
}
