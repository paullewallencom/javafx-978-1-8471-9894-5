package animation.trans;

import javafx.scene.shape.Circle;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.animation.transition.FadeTransition;

def w = 400;
def h = 200;
def r = 50;
def circle = Circle {
            centerX: w / 2;
            centerY: h / 2;
            radius: r
            fill: Color.BLUE;
            stroke: Color.WHITE;
            strokeWidth: 3
        }

FadeTransition {
    node: circle
    duration: 3s
    fromValue: 1.0 toValue: 0.25
    repeatCount: FadeTransition.INDEFINITE autoReverse: true
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
        content: [circle]
    }
}
