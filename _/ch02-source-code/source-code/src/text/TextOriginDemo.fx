/*
 * Main.fx
 *
 * Created on Mar 30, 2010, 12:39:53 PM
 */
package text;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.scene.paint.Color;
import javafx.scene.shape.Line;
import javafx.scene.text.TextOrigin;

/**
 * @author vvivien
 */
Stage {
    title: "Text Demo"
    scene: Scene {
        width: 400
        height: 250
        content: [
            Line{startX:50 startY:0 endX:50 endY:200 stroke:Color.SILVER}
            Line{startX:0 startY:25 endX:400 endY:25 stroke:Color.SILVER}
            Text {
                x:50 y: 25
                font: Font {size: 20 name:"Arial Black"}
                fill:Color.BROWN
                textOrigin: TextOrigin.BASELINE
                content: "This text uses\nTextOrigin.BASELINE"
            }
            Line{startX:0 startY:75 endX:400 endY:75 stroke:Color.SILVER}
            Text {
                x:50 y: 75
                font: Font {size: 20 name:"Arial Black"}
                fill:Color.BROWN
                textOrigin: TextOrigin.TOP
                content: "This text uses\nTextOrigin.TOP"
            }
            Line{startX:0 startY:200 endX:400 endY:200 stroke:Color.SILVER}
            Text {
                x:50 y: 200
                font: Font {size: 20 name:"Arial Black"}
                fill:Color.BROWN
                textOrigin: TextOrigin.BOTTOM
                content: "This text uses\nTextOrigin.BOTTOM"
            }
        ]
    }
}
