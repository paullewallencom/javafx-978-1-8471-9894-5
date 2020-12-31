package shapes;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.shape.Path;
import javafx.scene.shape.ArcTo;
import javafx.scene.shape.HLineTo;
import javafx.scene.shape.MoveTo;

Stage {
    title: "Path Drawing"
    width: 500
    height: 300
    x: 100;
    y: 200
    scene: Scene {
        content: [
            Path {
                elements: [
                    MoveTo { x: 150 y: 75 },
                    ArcTo { x: 200 y: 50 radiusX: 25 radiusY: 25 sweepFlag: true }
                    MoveTo { x: 200 y: 50 },
                    ArcTo { x: 250 y: 50 radiusX: 25 radiusY: 25 sweepFlag: true }
                    MoveTo { x: 250 y: 50 },
                    ArcTo { x: 300 y: 75 radiusX: 25 radiusY: 25 sweepFlag: true }
                    MoveTo { x: 25 y: 75 },
                    HLineTo { x: 425 },
                    MoveTo { x: 160 y: 85 },
                    HLineTo { x: 290 },
                    MoveTo { x: 170 y: 95 },
                    HLineTo { x: 280 },
                    MoveTo { x: 180 y: 105 },
                    HLineTo { x: 280 },
                ]
            }
        ]
    }
}
