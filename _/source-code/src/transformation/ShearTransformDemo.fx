package transformation;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.shape.Rectangle;
import javafx.scene.input.MouseEvent;
import javafx.scene.transform.Shear;

def w = 400;
def h = 200;
def rect:Rectangle = Rectangle {
            x: w/2 - 50 y:h/2 - 25
            width: w - 300
            height: h - 150;

            fill: Color.BLUE;
            stroke: Color.WHITE;
            strokeWidth: 3
            onMouseClicked:function(e:MouseEvent){
                rect.transforms = [Shear{y:-0.25}]
            }
        }

Stage {
    title: "Shear Transform"
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
        content: [rect]

    }
}
