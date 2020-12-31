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
import javafx.scene.text.FontWeight;

/**
 * @author vvivien
 */
Stage {
    title: "Text Demo"
    scene: Scene {
        width: 400
        height: 200
        content: [
            Text {
                x:50 y: 25
                wrappingWidth: 300
                font: Font.font("Arial", FontWeight.SEMI_BOLD, 28)
                fill:Color.BROWN
                content: "This is a simple text demo."
            }
        ]
    }
}
