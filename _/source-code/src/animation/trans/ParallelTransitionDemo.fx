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
import javafx.animation.transition.ParallelTransition;
import javafx.animation.transition.TranslateTransition;
import javafx.animation.transition.ScaleTransition;
import javafx.scene.shape.Rectangle;

    def w = 400;
    def h = 200;
    def r = 25;
    def circles = Group{
        cache: true
        content:[
            Circle {
                centerX: 0
                centerY: (h / 2)
                radius: r
                fill: Color.BLUE;
                stroke: Color.WHITE;
                strokeWidth: 3
            }

            Circle {
                centerX: 2*r
                centerY: (h / 2)
                radius: r
                fill: Color.BLUE;
                stroke: Color.WHITE;
                strokeWidth: 3
            }
        ]
    }

    def rect = Rectangle {x:10 y:10 width:50 height:20 fill:Color.RED}

    ParallelTransition {
        content: [
            RotateTransition {
                node: circles
                duration: 1s
                byAngle:360
                repeatCount: FadeTransition.INDEFINITE autoReverse: true
            }

            TranslateTransition {
                node: circles
                duration: 3s
                byX:w/2
                repeatCount: FadeTransition.INDEFINITE autoReverse: true
            }

            TranslateTransition {
                node: rect
                duration: 3s
                byY:h-30
                repeatCount: FadeTransition.INDEFINITE autoReverse: true
            }
        ]
    }.play();


Stage {
    title: "Parallel Transition"
    scene: Scene {
        width: w
        height: h
        fill: LinearGradient {
            startX: 0, endX: 0, startY: 0, endY: 1
            stops: [
                Stop { offset: 0, color: Color.GRAY }
                Stop { offset: 1, color: Color.WHITE }
            ]
        }
        content: [rect, circles]
    }
}
