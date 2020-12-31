package transformation;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.shape.Rectangle;
import javafx.scene.transform.Translate;
import javafx.scene.input.MouseEvent;

def w = 400;
def h = 200;
def rect:Rectangle = Rectangle {
            x: 0 y: 0
            width: w - 300
            height: h - 150;
            
            fill: Color.BLUE;
            stroke: Color.WHITE;
            strokeWidth: 3
            onMouseClicked:function(e:MouseEvent){
                rect.transforms = [Translate{x: e.x y:e.y}];
                println ("rect.x = {rect.x} rect.y = {rect.y} rect.translateX={rect.translateX}");
            }
        }

Stage {
    title: "Translate Transform"
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
