
package shapes;
import javafx.stage.Stage;
import javafx.stage.Screen;
import javafx.scene.Scene;

import javafx.scene.paint.Color;
import javafx.scene.shape.Line;
import javafx.scene.shape.Rectangle;
import javafx.scene.shape.Circle;
import javafx.scene.shape.Ellipse;
import javafx.scene.shape.StrokeLineCap;

def spacer = 100;
Stage {
    title: "Simple Shapes!"
    width: 500
    height: 300
    x: 100;
    y: 200
    scene: Scene {
        content: [
            Line {
                startX: 10
                startY: 10
                endX: 10 + spacer
                endY: 10 + spacer
                strokeWidth: 5.0
                stroke: Color.BLUE
                strokeLineCap: StrokeLineCap.BUTT
            },
            Rectangle {
                x: spacer + 50
                y: spacer + 20
                width: spacer + 20
                height: spacer
                arcWidth: 20
                arcHeight: 20
                fill: Color.RED
                strokeWidth: 5.0
                stroke: Color.BLUE
            },
            Circle {
                centerX: spacer + 300
                centerY: 50
                radius: 50
                fill: Color.GREEN
                strokeWidth: 1.0
                stroke: Color.BLACK
            },
            Ellipse {
                centerX: spacer + 300
                centerY: 150
                radiusX: 100
                radiusY: 20
                fill: Color.RED
                strokeWidth: 5.0
                stroke: Color.BLUE
            }
        ]
    }
}
