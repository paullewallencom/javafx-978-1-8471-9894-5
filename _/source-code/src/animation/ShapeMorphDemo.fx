package animation;

import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.scene.shape.Circle;
import javafx.scene.shape.DelegateShape;
import javafx.scene.shape.Rectangle;
import javafx.stage.Stage;
import javafx.scene.shape.Polygon;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.animation.Interpolator;

def rect = Rectangle { x: 200 y: 100 width: 100 height: 50 };
def circ = Circle { centerX: 200 centerY: 100 radius: 50 };
def poly = Polygon { points: [200, 50, 300, 150, 150, 150] };

def morph = DelegateShape {
        shape:poly
        fill: LinearGradient {
                startX: 0, endX: 0, startY: 0, endY: 1
                stops: [
                    Stop { offset: 0, color: Color.BLUE }
                    Stop { offset: 1, color: Color.WHITE }
                ]
            }
        stroke:Color.NAVY
        strokeWidth:4
}

var t = Timeline {
    autoReverse:true
    repeatCount:Timeline.INDEFINITE
    keyFrames: [
        KeyFrame { time: 2s values: [morph.shape => rect tween Interpolator.EASEBOTH]},
        KeyFrame { time: 4s values: morph.shape => circ},
        KeyFrame { time: 6s values: morph.shape => poly},
    ]
};

t.play();

Stage {
    title: "Morph Demo"
    scene: Scene {
        width: 400
        height: 200
        content: [morph]
    }
}
