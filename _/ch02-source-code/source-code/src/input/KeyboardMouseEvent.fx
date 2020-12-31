package input;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.scene.input.MouseEvent;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.KeyCode;
import javafx.scene.text.TextOrigin;

def w = 500;
def h = 300;
var text = Text {
            x: 10, y: 10
            fill: Color.LIMEGREEN
            font: Font { name: "Courier New" size: 12 }
            wrappingWidth: w - 100
            textOrigin: TextOrigin.TOP
        };
var rect: Rectangle = Rectangle {
            x: 0 y: 0
            width: w height: h
            onMouseClicked: function(e: MouseEvent): Void {
                rect.requestFocus();
                if (text.content.length() > 0) {
                    text.content = text.content.substring(0,
                            text.content.length() - 1);
                }
            }

            onKeyPressed: function(e: KeyEvent): Void {
                if (e.code.equals(KeyCode.VK_BACK_SPACE)
                        or e.code.equals(KeyCode.VK_DELETE)) {
                    if (text.content.length() > 0) {
                        text.content = text.content.substring(0,
                                text.content.length() - 1)
                    }
                } else if (e.code.equals(KeyCode.VK_SPACE)) {
                    text.content = "{text.content} ";
                } else if (e.code.equals(KeyCode.VK_ENTER)) {
                    text.content = "{text.content}\n";
                } else {
                    text.content = "{text.content}{e.text}";
                }
            }
        };

Stage {
    title: "Keyboard and Mouse Events"
    width: w
    height: h
    scene: Scene {
        content: [
            rect, text
        ]
    }
}

rect.requestFocus();