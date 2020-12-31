package animation;

import javafx.animation.Timeline;
import javafx.animation.KeyFrame;

var counter = 0;
var timer = Timeline {
            repeatCount: Timeline.INDEFINITE
            interpolate: false
            keyFrames: [
                KeyFrame {
                    time: 1s
                    action: function (): Void {
                        println(counter++);
                    }
                }
            ]
        }
timer.play();
