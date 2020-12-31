package shapes;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.shape.QuadCurve;

Stage {
    title: "Quad Curve Shapes!"
    width: 400
    height: 200
    scene: Scene {
        content: QuadCurve {
            startX: 200.0 startY: 50.0
            endX: 200.0  endY: 150.0
            controlX: 300.0
            controlY: 100.0
        }
    }
}
