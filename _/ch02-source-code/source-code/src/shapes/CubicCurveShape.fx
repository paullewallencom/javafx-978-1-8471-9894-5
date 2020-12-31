package shapes;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.shape.CubicCurve;

Stage {
    title: "Quad Curve Shape"
    width: 400
    height: 200
    scene: Scene {
        content: CubicCurve {
            startX: 50 startY: 100
            endX:   325 endY:   100
            controlX1: 100 controlY1: 0
            controlX2: 300 controlY2: 200
        }
    }
}
