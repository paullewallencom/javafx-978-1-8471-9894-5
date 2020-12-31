
package components;
import javafx.stage.Stage;
import javafx.scene.Scene;

import javafx.scene.Group;
import javafx.scene.paint.Color;
import javafx.scene.shape.Polygon;
import javafx.scene.shape.Arc;
import javafx.scene.shape.ArcType;

Stage {
    title: "Simple Shapes!"
    width: 500
    height: 300
    x: 100;
    y: 200
    scene: Scene {
        content: Group {
            content: [
                Polygon {
                    points: [
                        10.0, 10.0,
                        100.0, 100.0,
                        0.0, 100.0,
                        10.0, 10.0
                    ]
                },
                Arc {
                    centerX: 300 centerY: 50
                    radiusX: 50
                    radiusY: 50
                    startAngle: 45
                    length: 270
                    type: ArcType.ROUND
                }
            ]
        }
    }
}
