package effects;

import javax.imageio.ImageIO;
import java.net.URL;
import javafx.scene.paint.Paint;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.shape.Circle;
import javafx.scene.paint.Color;
import java.awt.geom.Rectangle2D;
import java.awt.TexturePaint;


class CustomPaint extends Paint {
    public-init var url:String;
    override public function impl_getPlatformPaint () : Object {
        var buff = ImageIO.read(new URL(url));
        new TexturePaint(
            buff,   new Rectangle2D.Double(0,0,64,52)
        );
    }
}

def w = 400;
def h = 200;

def circle = Circle {
    centerX:w/2 centerY:h/2
    radius:75
    fill:CustomPaint{url:"{__DIR__}texture.png"}
    stroke:Color.BLACK
    strokeWidth:3
};

Stage {
	title : "Custom Paint"
	scene: Scene {
		width: w
		height: h
		content: [ circle ]
	}
}
