package layout;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.layout.HBox;
import javafx.geometry.HPos;
import javafx.scene.paint.Color;
import javafx.scene.shape.Polygon;
import javafx.scene.shape.Arc;
import javafx.scene.shape.ArcType;
import javafx.scene.shape.Circle;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.geometry.VPos;

Stage {
    title: "Layout Example"
    width: 400
    height: 200
    x: 100;
    y: 200
    scene: Scene {
        content: HBox {
            width: 400
            spacing: 20
            hpos: HPos.LEADING
            content: [
                VBox {
                    spacing: 5
                    nodeHPos: HPos.CENTER
                    content: [
                        Polygon {
                            fill: Color.MAGENTA
                            points: [
                                10.0, 10.0,
                                100.0, 100.0,
                                0.0, 100.0,
                                10.0, 10.0
                            ]
                        },
                        Text { font: Font { size: 10 } content: "3-sided Polygon" }
                    ]
                },
                VBox {
                    spacing: 5
                    nodeHPos: HPos.CENTER
                    content: [
                        Arc {
                            radiusX: 45
                            radiusY: 45
                            startAngle: 90
                            length: 270
                            type: ArcType.ROUND
                            fill: Color.RED
                        },
                        Text { font: Font { size: 10 } content: "L-shaped red arc" }
                    ]
                },
                VBox {
                    spacing: 5
                    nodeHPos: HPos.CENTER
                    content: [
                        Circle {
                            centerY: 100
                            radius: 45
                            fill: Color.SILVER
                        },
                        Text { font: Font { size: 10 } content: "A silver circle" }
                    ]
                }
            ]
        }
    }
}
