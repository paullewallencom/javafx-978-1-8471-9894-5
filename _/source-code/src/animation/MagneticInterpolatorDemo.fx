
package animation;

import javafx.animation.SimpleInterpolator;
import javafx.scene.shape.Circle;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.animation.Timeline;

class MagneticInterpolator extends SimpleInterpolator {
    public var attraction:Number = 0.05;
    override public function curve (t : Number) : Number {
        if(t >= 1 - attraction){
            1;
        }else if(t < attraction){
            0;
        }else{
            t;
        }
    }
}

def circ = Circle { centerX: 25 centerY: 100 radius: 25 };

var t = Timeline {
    autoReverse:true
    repeatCount:Timeline.INDEFINITE
    keyFrames: [
        at(2s) {
            circ.centerX => 375
            tween MagneticInterpolator{attraction:0.07}
        }
    ]
};

t.play();

Stage {
    title: "Magnetic Interpolator"
    scene: Scene {
        width: 400
        height: 200
        content: [circ]
    }
}
