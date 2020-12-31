/*
 * Main.fx
 *
 * Created on Aug 12, 2009, 6:57:51 AM
 */

package demo;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.Text;
import javafx.scene.text.Font;

/**
 * @author vladimir
 */

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