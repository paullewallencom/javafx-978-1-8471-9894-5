import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.scene.text.Text;
import javafx.scene.effect.Reflection;
import javafx.scene.effect.DropShadow;
import javafx.scene.effect.Lighting;
import javafx.scene.effect.light.DistantLight;

var w=800;
var h=100;

public var textContent = "Text Commander";
public var textColor = "blue";
public var textColorEnd = "blue";
public var textStrokeColor = "blue";
public var textStrokeWidth = "1";
public var textFont = "Helvetica";

var text:Text;

public function applyEffect(effect:Integer) {

    if(effect==0){
        text.effect = null;
    }
    if(effect==1){
        text.effect = Reflection{fraction:0.50};
    }
    if(effect==2){
        text.effect = DropShadow{offsetY:4}
    }
    if(effect==3){
        text.effect = Lighting {
          light: DistantLight { azimuth: -135 }
          surfaceScale: 5
        }
    }
}

public function run() {
    text = Text {
        content: bind textContent
        style: bind "fill:{textColor};"
            "font-family:\"{textFont}\";"
            "font-size:64pt;"
            "font-weight:bold;"
            "fill:linear (0%, 0%) to (0%,100%) stops (0.0, {textColor}), (1.0, {textColorEnd});"
        translateY : bind text.boundsInLocal.height;
        translateX : bind w/2 - (text.boundsInLocal.width/2);
    }

    Stage {
        title : "Text Commander"
        width: w
        height: h
        scene: Scene {
            width: 200
            height: 200
            content: bind text
        }
    }
}