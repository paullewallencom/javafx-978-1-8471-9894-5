package animation;

import javafx.scene.shape.Rectangle;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.paint.Color;
import javafx.scene.effect.PerspectiveTransform;
import javafx.util.Math;
import javafx.animation.Timeline;
import javafx.scene.input.MouseEvent;

def w = 400;
def h = 200;
def rw = 100;
def rh = 150;
def rx = (w - rw) / 2;
def ry = (h - rh) / 2;
def rad = (w - rw);
def back = (h - rh);
var angle = Math.PI/2;

def pers = PerspectiveTransform {
            ulx: rx uly: ry
            llx: rx lly: ry + rh

            urx: Math.sin(angle) * (rx + rw)  ury: rh + Math.cos(angle) * ry
            lrx: Math.sin(angle) * (rx + rw)  lry: rh + Math.cos(angle) * (ry + rh)
        }

println ("rx = {rx} ry = {ry} urx = {pers.urx} ury = {pers.ury} lrx = {pers.lrx} lry = {pers.lry}");

def flip = Timeline {
            keyFrames: [
                at (0s) {angle => Math.PI/2}
                at (3s) {angle => Math.PI / 16}
            ]
        }
def rect: Rectangle = Rectangle {
            x: (w - rw) / 2 y: (h - rh) / 2
            width: rw, height: rh
            fill: Color.BLUE
            stroke: Color.RED strokeWidth: 2
            arcHeight: 10 arcWidth: 10
            effect: bind pers
            onMousePressed: function (e: MouseEvent) {
                //rect.effect = pers;
                //flip.playFromStart();
            }
        }

def rect2 = Rectangle {x: pers.ulx y:pers.uly width:pers.urx height:pers.lry}

Stage {
    title: "Hit!"
    scene: Scene {
        width: w
        height: h
        fill: LinearGradient {
            startX: 0, endX: 0, startY: 0, endY: 1
            stops: [
                Stop { offset: 0, color: Color.GRAY }
                Stop { offset: 1, color: Color.WHITE }
            ]
        }
        content: [rect]
    }
}
