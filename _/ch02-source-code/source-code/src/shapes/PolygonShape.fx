package shapes;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.shape.Polygon;

Stage {
    title: "Polygon Shape"
    width: 500
    height: 300
    x: 100;
    y: 200
    scene: Scene {
        content: [
            Polygon {
                points: [
                    10.0, 10.0,
                    100.0, 100.0,
                    0.0, 100.0,
                    10.0, 10.0
                ]
            }
        ]
    }
}