package effects;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.effect.Reflection;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.animation.Timeline;
import javafx.scene.shape.Circle;

def w = 400;
def h = 200;

var grad =  LinearGradient {
    startX: 0.0, startY: 0.0, endX: 0.0, endY: 1.0
    proportional: true
    stops: [ Stop { offset: 0.0 color: Color.DARKBLUE },
             Stop { offset: 1.0 color: Color.LIGHTBLUE } ]
}

var reflect = Reflection {
    fraction: 0.50
    topOpacity: 0.50
    bottomOpacity: 0.0
    topOffset: 2.0
};

var rect = Rectangle {
    x:130 y:50 width:100, height:80
    stroke:Color.RED strokeWidth:2
    arcHeight:10 arcWidth:10
    fill:grad
    effect:reflect
}
var circ = Circle {
    centerX:290 centerY:75 radius:50
    stroke:Color.BLUE strokeWidth:2
    fill:grad
    effect:reflect
}

Stage {
    title: "Reflection Effect"
    width: w
    height:h
    scene: Scene {
        fill:Color.BLACK
        content : [rect,circ]
    }
}