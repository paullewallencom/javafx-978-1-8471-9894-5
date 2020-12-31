package animation.trans;

import javafx.scene.shape.Circle;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.animation.transition.FadeTransition;
import javafx.scene.Group;
import javafx.animation.transition.RotateTransition;

def w = 400;
def h = 200;
def r = 50;
def circles = Group{
    cache: true
    content:[
        Circle {
            centerX: (w / 2) - r
            centerY: (h / 2)
            radius: r
            fill: Color.BLUE;
            stroke: Color.WHITE;
            strokeWidth: 3
        }

        Circle {
            centerX: (w / 2) + r
            centerY: (h / 2)
            radius: r
            fill: Color.BLUE;
            stroke: Color.WHITE;
            strokeWidth: 3
        }
    ]
}




RotateTransition {
    node: circles
    duration: 1s
    byAngle:360
    repeatCount: RotateTransition.INDEFINITE autoReverse: true
}.playFromStart();

Stage {
    title: "MyApp"
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
        content: [circles]
    }
}
