package image;

import javafx.scene.layout.HBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextBox;
import javafx.scene.control.Button;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.geometry.VPos;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import javafx.scene.Group;
import javafx.scene.paint.Color;
import javafx.scene.control.Slider;
import javafx.scene.effect.Reflection;
import javafx.scene.effect.GaussianBlur;
import javafx.scene.effect.Lighting;
import javafx.scene.effect.Glow;
import javafx.scene.effect.light.PointLight;
import javafx.scene.effect.SepiaTone;
import javafx.animation.transition.TranslateTransition;

def w = 800;
def h = 600;
def maxW = w * 0.7;
def maxH = h * 0.7;
var scene:Scene;

def slider = Slider{min:1 max:1.5 value:1 clickToPosition:true snapToTicks:true}

def imgView:ImageView = ImageView{
    preserveRatio:true
    fitWidth:bind if((slider.value*maxW) < w) maxW * slider.value else w
    fitHeight:bind if((slider.value*maxH) < h)maxH * slider.value else h
    translateX:(w-maxW)/2 translateY:(h-maxH)/2
};

var anim = TranslateTransition{
     fromX:0 toX:w - maxW
     node:imgView repeatCount:TranslateTransition.INDEFINITE
     autoReverse:true
}

var rotateAngle = 0;

function loadImg(){
    imgView.image = Image{
        url:(scene.lookup("addr") as TextBox).text
        backgroundLoading:true
        placeholder:Image{url:"{__DIR__}loading.jpg"}
    }
}

def addrBar = Group{
    layoutX: 20
    layoutY: 20
    content:HBox {
        nodeVPos:VPos.CENTER
        spacing:7
        content:[
            Label{text:"Image URL:" textFill:Color.SILVER}
            TextBox{id:"addr" columns:80 promptText:"http://"
                action:function(){loadImg()}
            }
            Button{id:"btnGo" text:"Get Image"
                action:function(){loadImg()}
            }
        ]
    }
}


def footer = Group{
    layoutX: 20
    layoutY: h - 60
    content:HBox {
        spacing: 12
        content:[
            slider,

            Button{text:" Rotate " action:function(){
                rotateAngle = rotateAngle + 90;
                imgView.rotate = rotateAngle;
            }}

            HBox{spacing:7 content:[
                
                Button{text:"Reflection" onMouseClicked:function(e){
                    imgView.effect = if(imgView.effect == null
                        or not (imgView.effect instanceof Reflection))
                        Reflection{fraction:0.3 topOffset:0}
                    else null
                }}
                Button{text:"Glow" onMouseClicked:function(e){
                    imgView.effect = if(imgView.effect == null
                        or not(imgView.effect instanceof Glow))
                        imgView.effect = Glow{level:0.7}
                    else null
                }}

                Button{text:"Blur" onMouseClicked:function(e){
                    imgView.effect = if(imgView.effect == null
                        or not(imgView.effect instanceof GaussianBlur))
                        imgView.effect = GaussianBlur{radius:10.0} else null
                }}
                Button{text:"Lighting" onMouseClicked:function(e){
                    imgView.effect = if(imgView.effect == null
                        or not (imgView.effect instanceof Lighting))
                        imgView.effect = Lighting{
                            surfaceScale:7.0
                            light:PointLight{x:600 y:0 z:300}}
                    else null
                }}
                Button{text:"Sepia" onMouseClicked:function(e){
                    imgView.effect = if(imgView.effect == null
                        or not (imgView.effect instanceof SepiaTone)
                    )
                        SepiaTone{level:0.7}
                    else null
                }}
                Button{text:"Animate" onMouseClicked:function(e){
                    if(not anim.running){
                       anim.play();
                    }else{
                       anim.stop();
                    }
                }}
            ]}
        ]
    }
}


Stage {
	title : "Image Browser"
	scene: scene = Scene {
                fill:Color.BLACK
		width: w
		height: h
		content: [imgView, addrBar, footer ]
	}
}
