package animation;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.animation.transition.ParallelTransition;
import javafx.animation.transition.TranslateTransition;
import javafx.animation.transition.ScaleTransition;
import javafx.animation.transition.FadeTransition;
import javafx.scene.shape.Circle;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.Color;
import javafx.animation.Timeline;

def w = 400;
def h = 200;
def r = 30;
def rw = 100;
def rh = 40;

var circle = Circle {centerX: w/2 centerY:h/2 radius:r fill: Color.DARKBLUE }
var rect = Rectangle {x:w/2+r y:h/2-rh/2 width:rw, height:rh fill: Color.RED }

var anim = ParallelTransition {
    autoReverse:true
    repeatCount:Timeline.INDEFINITE
    content: [
        FadeTransition {
            node: rect
            duration: 1s
            fromValue: 1.0 toValue: 0.3
            repeatCount: 2 autoReverse: true
        },
        ScaleTransition {
            node: circle
            byX: 1.5 byY: 1.5
            duration: 1s
            repeatCount: 2
            autoReverse: true
        },
        TranslateTransition {
            node: rect
            byX: 200
            autoReverse: true
            duration: 1s
            repeatCount: 2
        }
    ]
}
anim.play();

Stage {
    title: "Simple Transition"
    width: w
    height: h
    scene: Scene {
        content: [circle,rect]
    }
}
