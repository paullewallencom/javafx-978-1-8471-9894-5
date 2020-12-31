package cookbook.app;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.Text;
import javafx.scene.text.Font;

println ("Current profile {__PROFILE__}");

Stage {
    title: "Application title"
    width: 250
    height: 80
    scene: Scene {
        content: [
            Text {
                font : Font {
                    size : 16
                }
                x: 10
                y: 30
                content: "Application content"
            }
        ]
    }
}