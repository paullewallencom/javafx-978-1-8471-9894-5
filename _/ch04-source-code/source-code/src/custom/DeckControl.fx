package custom;

import javafx.scene.shape.Rectangle;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.control.Control;
import javafx.scene.Group;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Paint;
import javafx.scene.paint.Stop;
import javafx.scene.shape.Circle;
import javafx.animation.transition.TranslateTransition;
import javafx.scene.layout.Stack;
import javafx.scene.effect.Reflection;
import javafx.scene.layout.HBox;
import javafx.geometry.HPos;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;

class Deck extends Control {
    override public var width = 200;
    override public var height = 100;
    public var roundCornerSize:Integer = 0;
    public var borderSize:Integer = 2;
    public var borderColor:Color = Color.BLACK;
    public var slideOffset:Integer=20;
    public var duration:Duration = 300ms;
    public var enableReflection:Boolean = true;

    public var fill:Paint = LinearGradient {
        startX: 0, endX: 0, startY: 0, endY: 1
        stops: [
            Stop { offset: 0, color: Color.DARKGRAY }
            Stop { offset: 1, color: Color.GRAY }
        ]
    }

    def stack = Group{}


    public function add(n:Node){
        insert createCard(n) into stack.content
    }

    public function remove(idx:Integer){
        def obj = stack.content[idx];
        delete obj from stack.content;
    }

    public function shiftBackToFront():Void {
          def node = stack.content[0];
          animate(node, 0);
    }

    public function shiftFrontToBack():Void {
        def node = stack.content[(sizeof stack.content)-1];
        animate(node, 1);
    }


    override function create():Node {
        stack.effect = if(enableReflection)Reflection{fraction:0.35} else null;
        stack
    }

    function createCard(node:Node):Group {
        Group {
            content:[
                Stack{content:[
                Rectangle{
                    width:width height:height
                    arcWidth:roundCornerSize arcHeight:roundCornerSize
                    fill:fill
                    stroke:borderColor
                    strokeWidth:borderSize},
                node
                ]}
            ]
        }
    }

    function animate(node:Node, dir:Integer){
          TranslateTransition {
              duration:duration
              autoReverse:true
              repeatCount:2
              node:node
              byX:width + slideOffset
              action:function(){
                  if(dir == 0)
                    node.toFront()
                  else
                    node.toBack()
              }
          }.playFromStart();
    }
}

def w = 400;
def h = 320;
var scene:Scene;

def deck:Deck = Deck{
    width:w-100 height:h-100
    translateX:(w -(w-100))/2 translateY:(h-(h-100))/2
    slideOffset:50
    duration:300ms
    roundCornerSize:20
}

deck.add(Rectangle {width:150 height:100 fill:Color.RED});
deck.add(Circle{radius:70 fill:Color.BLUE});
deck.add(ImageView{
    image:Image{url:"{__DIR__}image1.png"}fitWidth:200
    preserveRatio:true
});
deck.add(ImageView{
    image:Image{url:"{__DIR__}image2.png"}fitWidth:200
    preserveRatio:true
});
deck.add(ImageView{
    image:Image{url:"{__DIR__}image3.png"}fitWidth:200
    preserveRatio:true
});
deck.add(ImageView{
    image:Image{url:"{__DIR__}image4.png"}fitWidth:200
    preserveRatio:true
});
deck.add(ImageView{
    image:Image{url:"{__DIR__}image5.png"}fitWidth:200
    preserveRatio:true
});

def leftBtn = Button {
    text:"<<"
    action:function(){
        deck.shiftBackToFront();
    }
}
def rightBtn = Button {
    text:">>"
    action:function(){
        deck.shiftFrontToBack();
    }
}

Stage {
    title : "Deck Effect"
    scene: scene = Scene {
        fill:Color.BLACK
        width: w height: h
        content: [
            deck,
            HBox{
                translateY:h-20 width:w
                hpos:HPos.CENTER
                content:[leftBtn, rightBtn]
            }
        ]
    }
}
