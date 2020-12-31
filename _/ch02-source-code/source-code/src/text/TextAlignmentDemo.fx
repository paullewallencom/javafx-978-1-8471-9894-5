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
import javafx.scene.text.TextAlignment;

/**
 * @author vvivien
 */
Stage {
    title: "Text Demo"
    scene: Scene {
        width: 400
        height: 450
        content: [
            Text {
                x:50 y: 25
                font: Font {size: 18 name:"Arial" }
                fill:Color.BLACK
                wrappingWidth:300
                content: "This is a simple text demo."
                         "It shows how the text is automatically "
                         "centered using TextAlignment.CENTER"
                textAlignment:TextAlignment.CENTER
            }

            Text {
                x:50 y: 100
                font: Font {size: 18 name:"Times New Roman" }
                fill:Color.BROWN
                wrappingWidth:300
                content: "This is a simple text demo."
                         "It shows how text is automatically "
                         "left-aligned using TextAlignment.LEFT"
                textAlignment:TextAlignment.LEFT
            }

            Text {
                x:50 y: 175
                font: Font {size: 18 name:"Sans Serif" }
                fill:Color.MAROON
                wrappingWidth:300
                content: "This is a simple text demo."
                         "It shows how text is automatically "
                         "right-aligned using TextAlignment.RIGHT"
                textAlignment:TextAlignment.RIGHT
            }

            Text {
                x:50 y: 250
                font: Font {size: 18 name:"Verdana" }
                fill:Color.GRAY
                wrappingWidth:300
                content: "This is a simple text demo.  "
                         "It shows how text is automatically "
                         "justified using TextAlignment.JUSTIFY"
                textAlignment:TextAlignment.JUSTIFY
            }

             Text {
                x:50 y: 350
                font: Font {size: 18 name:"Calibri" }
                fill:Color.BLACK
                wrappingWidth:300
                content: "This is a simple text demo.  "
                         "It shows how text is automatically "
                         "wrapped using WrappingWidth."
            }
         ]
    }
}
