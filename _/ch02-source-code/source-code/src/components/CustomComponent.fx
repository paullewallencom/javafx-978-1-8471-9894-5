package components;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.Node;
import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.scene.shape.Circle;
import javafx.scene.input.MouseEvent;

class Crawler extends CustomNode {

    public var message;
    public var x = 10;
    public var y = 10;
    public var width = 100;
    public var height = 25;
    public var bgColor = Color.LIGHTYELLOW;
    public var borderSize = 4;
    public var borderColor = Color.BLUE;

    override function create(): Node {
        return Group {
                    content: [
                        Rectangle {
                            x: bind x
                            y: bind y
                            width: bind width
                            height: bind height
                            fill: bgColor;
                            stroke: bind borderColor;
                            strokeWidth: bind borderSize;
                            arcHeight: 20 arcWidth: 20
                            onMousePressed: function (e: MouseEvent): Void {
                                width = width + 10;
                            }
                            onMouseReleased: function (e: MouseEvent): Void {
                                x = x + 10;
                                width = width - 10;
                            }
                        },
                        Circle { centerX: bind (x + width) centerY: bind (y + 5) radius: 5 }
                        Circle { centerX: bind (x + width) centerY: bind ((y + height) - 5) radius: 5 }
                    ]
                };
    }

}

Stage {
    title: "Crawlies"
    width: 500
    height: 300
    x: 100;
    y: 200
    scene: Scene {
        content: [
            Crawler { x: 10 y: 10 height: 25 }
            Crawler { x: 10 y: 45 height: 35 bgColor: Color.SILVER }
        ]
    }
}
