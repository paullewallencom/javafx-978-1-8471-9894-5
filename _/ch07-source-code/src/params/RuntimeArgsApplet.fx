import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.scene.text.Text;
import javafx.scene.text.Font;


var name = FX.getArgument("name");

var msg:Text = Text {
    font : Font {
        size : 52
        embolden: true
        name: "sans-serif,Arial,Helvetica"
    }
    content: bind "Hello {name}!"
    fill:Color.WHITE
}
msg.translateY = msg.boundsInLocal.height;

Stage {
    title: "Application title"
    width: msg.boundsInLocal.width
    height: msg.boundsInLocal.height * 2
    scene: Scene {
        fill:Color.BLUE
        content: [msg]
    }
}