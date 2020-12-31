package animation;

import javafx.scene.shape.Circle;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.animation.Timeline;
import javafx.animation.KeyFrame;
import javafx.scene.input.MouseEvent;
import javafx.animation.Interpolator;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Text;
import javafx.scene.text.TextOrigin;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;

def w = 400;
def h = 200;
var rad = 15.0;
var cx = w / 2;
var cy = h - rad;
var scoreCounter = 0;
def paddleTime = 0.5s;

def score = Text {
            textOrigin: TextOrigin.TOP x: w / 2 y: h / 2
            font: Font.font("Helvetica", FontWeight.BOLD, 48)
            content: bind "{scoreCounter}"
            visible: false
        }

def scoreAnim = Timeline {
            keyFrames: [
                at (1s) {
                    score.scaleX => 3;
                    score.scaleY => 3;
                    score.opacity => 0.0;
                    score.visible => false
                }
            ]
        }

def paddle: Rectangle = Rectangle {
            x: 10 y: 10;
            width: 50 height: 10
            fill: Color.BLUE stroke: Color.WHITE strokeWidth: 3
        }

def paddleAnim = Timeline {
            autoReverse: true
            repeatCount: Timeline.INDEFINITE
            keyFrames: [KeyFrame{time:paddleTime values:paddle.translateX => 350}]
        }

paddleAnim.play();

def ball: Circle = Circle {
            radius: bind rad
            centerX: bind cx;
            centerY: bind cy;
            fill: Color.RED
            stroke: Color.WHITE
            strokeWidth: 3
            onMousePressed: function (e: MouseEvent) {
                ballAnim.playFromStart();
            }
        }
        
var ballAnim: Timeline = Timeline {
            keyFrames: [
                KeyFrame {
                    time: 200ms
                    values: [cy => 5 tween Interpolator.EASEIN]
                    action: function () {
                        if (ball.intersects(paddle.boundsInParent)) {
                            scoreCounter++;
                            score.visible = true;
                            scoreAnim.playFromStart();
                        }

                    }
                }
                KeyFrame {
                    time: 500ms
                    values: [cy => (h - rad) tween Interpolator.LINEAR]
                }
            ]
        }



Stage {
    title: "Hit!"
    scene: Scene {
        width: w
        height: h
        fill: LinearGradient {
            startX: 0, endX: 0, startY: 0, endY: 1
            stops: [
                Stop { offset: 0, color: Color.rgb(202, 202, 202) }
                Stop { offset: 1, color: Color.rgb(97, 97, 97) }
            ]
        }
        content: [score, paddle, ball]
    }
}
