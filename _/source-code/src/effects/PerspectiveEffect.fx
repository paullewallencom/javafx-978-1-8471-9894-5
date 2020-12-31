package effects;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.effect.PerspectiveTransform;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.animation.Timeline;

var paint =  LinearGradient {
    startX: 0.0, startY: 0.0, endX: 0.0, endY: 1.0
    proportional: true
    stops: [ Stop { offset: 0.0 color: Color.DARKBLUE },
             Stop { offset: 1.0 color: Color.BLUE } ]
}

var x = 220;
var y = 110;
var w = 200;
var h = 100;
var ulx = x;
var urx = ulx + w;
var uly = y;
var ury = y;
var llx = ulx;
var lrx = urx;
var lly = uly + h;
var lry = lly;

def pers = PerspectiveTransform {
	ulx: bind ulx uly: bind uly
	urx: bind urx ury: bind ury
	llx: bind llx lly: bind lly
	lrx: bind lrx lry: bind lry

}


def rect = Rectangle {
    x:bind x y:bind y
    width:bind w, height:bind h
    stroke:Color.RED strokeWidth:2
    arcHeight:10 arcWidth:10
    fill:paint
    effect:pers
    cache:true
}

def anim = Timeline {
    autoReverse:true
    repeatCount:Timeline.INDEFINITE
    keyFrames: [
    	at(0s){rect.translateX => 0 - x}
    	at(0s){uly => y - 50}
    	at(0s){lly => y+h+50}
    	at(0s){ury => y}
    	at(0s){lry => y+h}

    	
    	at(2s){rect.translateX => x }
    	at(2s){uly => y}
    	at(2s){lly => y + h}
    	at(2s){ury => y - 50}
    	at(2s){lry => y+h+50}
    ]
}
anim.play();

Stage {
	title: "3D Perspective"
	width: 640
	height:480
	scene: Scene {
		content : [
            rect
        ]
    }
}