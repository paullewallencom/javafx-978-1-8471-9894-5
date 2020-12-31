package animation;

import javafx.scene.shape.Circle;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.scene.input.MouseEvent;
import javafx.animation.Timeline;
import javafx.animation.Interpolator;

def w = 400;
def h = 200;
def width = 50;
def rad = width/2;
def spacer = 30;

var locY = h - width;

def circ1 = Circle {
    centerX: rad + spacer centerY: bind (locY + rad)
    radius: rad
}
def rec1 = Rectangle {
    x: circ1.boundsInLocal.maxX + spacer y: bind locY
    width:width height:width
}

def circ2 = Circle {
    centerX: rec1.boundsInLocal.maxX + spacer + rad
    centerY: bind (locY + rad) radius: rad
}

def rec2 = Rectangle {
    x: circ2.boundsInLocal.maxX + spacer y: bind locY
    width:width height:width
}

Timeline {
    repeatCount:Timeline.INDEFINITE
    autoReverse:true
    keyFrames:[
        at(1s){locY => width tween Interpolator.EASEBOTH}
    ]
}.play();



Stage {
    title: "Hit!"
    scene: Scene {
        width: w
        height: h
        fill: LinearGradient {
            startX: 0, endX: 0, startY: 0, endY: 1
            stops: [
                Stop { offset: 0, color: Color.WHITE }
                Stop { offset: 1, color: Color.GRAY}
            ]
        }
        content: [circ1, rec1, circ2, rec2]
    }
}