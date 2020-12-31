package myapplet;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;
import javafx.scene.text.Font;


var msg:Text = Text {
    font : Font {
        size : 52
        embolden: true
        name: "sans-serif,Arial,Helvetica"
    }
    content: "I am Browser-Embedded"
    fill:Color.WHITE
}
msg.translateY = msg.boundsInLocal.height;

Stage {
    title: "Simple Applet"
    width: msg.boundsInLocal.width
    height: msg.boundsInLocal.height * 2
    scene: Scene {
        fill:Color.BLUE
        content: [msg]
    }
}