package effects;

import javafx.scene.text.Text;
import javafx.scene.text.TextOrigin;
import javafx.scene.text.Font;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.FontWeight;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.shape.ShapeSubtract;
import javafx.scene.effect.DropShadow;
import javafx.scene.text.TextAlignment;

def w = 400; def h = 200;
def rw = w - 100; def rh = h - 50;

def bg = Rectangle {
            x: w/2-rw/2 y: h/2-rh/2 width: rw height: rh
            fill: LinearGradient {
                startX: 0, endX: 0, startY: 0, endY: 1
            }
        }
def text: Text = Text {
    content: "Hello!"
    font: Font.font("Arial", FontWeight.BOLD, 100);
    fill: Color.SILVER
    textOrigin: TextOrigin.TOP
    textAlignment:TextAlignment.JUSTIFY
}
// center text
text.x = (w - text.layoutBounds.width) / 2.0;
text.y = (h - text.layoutBounds.height) / 2.0;

def txtfx:ShapeSubtract = ShapeSubtract {
            a: bg
            b: text
            effect: DropShadow {
                color: Color.rgb(0, 0, 0, 0.9)
                offsetX: 5, offsetY: 5
                radius: 10
            }
            fill: LinearGradient {
                startX: 0, endX: 0, startY: 0, endY: 1
                stops: [
                    Stop { offset: 0, color: Color.SILVER }
                    Stop { offset: 1, color: Color.WHITE }
                ]
            }
        }

Stage {
    title: "Cutout"
    scene: Scene {
        width: w
        height: h
        fill: Color.GRAY
        content: [txtfx]
    }
}
