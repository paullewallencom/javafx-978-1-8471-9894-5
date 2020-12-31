package draggable;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.animation.Timeline;
import javafx.animation.KeyFrame;

import javafx.stage.AppletStageExtension;

import java.text.SimpleDateFormat;
import java.util.Date;

var currTime = function():String{new SimpleDateFormat("hh:mm:ss").format(new Date())}
var time:String = currTime();
Timeline {
    repeatCount:Timeline.INDEFINITE interpolate:false
    keyFrames: KeyFrame {
        time: 1s
        action:function() {time = currTime()}
    }
}.play();

var msg:Text = Text {
    font:Font{size:52 embolden:true name:"sans-serif"}
    content: bind time
    fill:Color.WHITE
}
msg.translateY = msg.boundsInLocal.height;

var stat = Text {
    font : Font {size:12 name:"sans-serif"}
    fill:Color.YELLOW
    content: "{__PROFILE__}: App in Place"
}
stat.translateY = 60;

Stage {
    title: "Draggable Clock Demo"
    width: msg.boundsInLocal.width
    height: msg.boundsInLocal.height * 2
    scene: Scene {
        fill:Color.BLUE
        content: [msg,stat]
    }

    extensions: [
        AppletStageExtension {
            shouldDragStart: function(e): Boolean {
                stat.content = "{__PROFILE__}: Dragged out of Browser";
                return true;
            }
            onDragStarted: function():Void {
                stat.content = "{__PROFILE__}: Dragging...";
            }
            onDragFinished: function(): Void  {
                stat.content = "{__PROFILE__}: Out of browser"
            }
            onAppletRestored: function(): Void  {
                stat.content = "{__PROFILE__}: In Browser"
            }
            useDefaultClose: true
        }
    ]

}