package webstart.demo;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.Text;
import javafx.scene.text.Font;


var msg:Text = Text {
    font : Font {
        size : 72
        embolden: true
        name: "sans-serif,Arial,Helvetica"
    }
    content: "I was Web Started!"
}
msg.translateY = msg.boundsInLocal.height;

Stage {
    title: "Web Start Demo"
    width: msg.boundsInLocal.width
    height: msg.boundsInLocal.height * 2
    scene: Scene {
        content: [msg]
    }
}