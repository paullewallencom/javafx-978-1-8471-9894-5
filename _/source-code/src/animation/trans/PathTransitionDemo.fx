package animation.trans;

import javafx.scene.shape.Circle;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.animation.transition.FadeTransition;
import javafx.scene.shape.Path;
import javafx.scene.shape.MoveTo;
import javafx.animation.transition.PathTransition;
import javafx.animation.transition.AnimationPath;
import javafx.scene.shape.LineTo;
import javafx.scene.shape.HLineTo;
import javafx.scene.shape.VLineTo;
import javafx.scene.shape.CubicCurveTo;
import javafx.scene.shape.QuadCurveTo;
import javafx.scene.shape.ArcTo;

def w = 400;
def h = 200;
def r = 30;
def mv = 60;

def circle = Circle {
            centerX: 0;
            centerY: 0;
            radius: r
            fill: Color.BLUE;
            stroke: Color.WHITE;
            strokeWidth: 3
        }

var path = Path {
    elements:[
        MoveTo{x:0 y:0}
        HLineTo { x: mv}
        VLineTo { y: h }

        HLineTo { x: mv * 2}
        VLineTo { y: 0 }

        HLineTo { x: 3 * mv}
        VLineTo { y: h/2 }

        MoveTo{x: 3 * mv y: h/2}
        ArcTo {
            radiusX: 20
            radiusY: 20
            x: 5 * mv y:h/2
            sweepFlag:true   
        }
    ]

}


PathTransition {
    node: circle
    duration: 5s
    path:AnimationPath.createFromPath(path)
    repeatCount: FadeTransition.INDEFINITE autoReverse: true
}.playFromStart();

Stage {
    title: "Path Transition"
    scene: Scene {
        width: w
        height: h
        fill: LinearGradient {
            startX: 0, endX: 0, startY: 0, endY: 1
            stops: [
                Stop { offset: 0, color: Color.SILVER }
                Stop { offset: 1, color: Color.WHITE }
            ]
        }
        content: [circle]
    }
}
