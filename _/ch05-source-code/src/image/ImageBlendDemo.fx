package image;

import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.scene.Group;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.effect.BlendMode;
import javafx.scene.layout.VBox;
import javafx.scene.layout.HBox;
import javafx.scene.control.TextBox;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.paint.Color;
import javafx.geometry.HPos;
import javafx.scene.control.Button;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.scene.effect.DropShadow;
import javafx.scene.control.RadioButton;
import javafx.scene.control.ToggleGroup;
import javafx.animation.Timeline;
import javafx.animation.KeyFrame;

var scene:Scene;
def w = 800;
def h = 600;
def maxW = w * 0.4;
def maxH = h * 0.5;

def img1 = ImageView{
    translateX:10
    translateY:10
    preserveRatio:true
    fitWidth:maxW
    fitHeight:maxH
}
def img2 = ImageView{
    translateX:w - maxW
    translateY:10
    preserveRatio:true
    fitWidth:maxW
    fitHeight:maxH
}

def imgPanel = Group {
    content:[
        img1, img2
    ]
}

def anim = Timeline {
    keyFrames: [
        KeyFrame{time:1s
            values: [
                img1.translateX => (w - img1.fitWidth)/2
            ]
        }
        KeyFrame{time:1s
            values: [
                img2.translateX => (w - img2.fitWidth)/2
            ]
        }
    ]
}


function loadImg(view:ImageView,url:String){
    view.effect = null;
    view.image = Image{
        backgroundLoading:true
        url:url
     }
}


def toggleGrp = ToggleGroup{}
def controls = Group{
    layoutY: h - 200
    content:[
        VBox{width:w spacing:12 hpos:HPos.CENTER nodeHPos:HPos.CENTER content:[
            TextBox{id:"addr1" columns:60 promptText:"http://" action:function(){
                loadImg(img1,(scene.lookup("addr1") as TextBox).text)
                
            }}

            TextBox{id:"addr2" columns:60 promptText:"http://" action:function(){
                loadImg(img2,(scene.lookup("addr2") as TextBox).text)
            }}

            HBox{
                content:[
                    RadioButton{text:"ADD" toggleGroup:toggleGrp selected:true}
                    RadioButton{text:"COLOR_BURN" toggleGroup:toggleGrp}
                    RadioButton{text:"COLOR_DODGE" toggleGroup:toggleGrp}
                    RadioButton{text:"DARKEN" toggleGroup:toggleGrp}
                    RadioButton{text:"DIFFERENCE" toggleGroup:toggleGrp}
                    RadioButton{text:"EXCLUSION" toggleGroup:toggleGrp}
                    RadioButton{text:"HARD_LIGHT" toggleGroup:toggleGrp}
                    RadioButton{text:"LIGHTEN" toggleGroup:toggleGrp}
                    
                ]
            }
            HBox{
                content:[
                    RadioButton{text:"MULTIPLY" toggleGroup:toggleGrp}
                    RadioButton{text:"OVERLAY" toggleGroup:toggleGrp}
                    RadioButton{text:"RED" toggleGroup:toggleGrp}
                    RadioButton{text:"SCREEN" toggleGroup:toggleGrp}
                    RadioButton{text:"SOFT_LIGHT" toggleGroup:toggleGrp}
                    RadioButton{text:"SRC_ATOP" toggleGroup:toggleGrp}
                    RadioButton{text:"SRC_IN" toggleGroup:toggleGrp}
                    RadioButton{text:"SRC_OUT" toggleGroup:toggleGrp}
                    RadioButton{text:"SRC_OVER" toggleGroup:toggleGrp}

                ]
            }
            Button{
                text:"Blend Images"
                font:Font.font("Sans Serif", FontWeight.BOLD, 18)
                effect:DropShadow{offsetX:3 offsetY:3}
                onMouseClicked:function(e){
                    def mode = toggleGrp.selectedButton.text;
                    imgPanel.blendMode = BlendMode.valueOf(mode);
                    anim.rate = 1.0;
                    anim.playFromStart();
                }

                onMouseReleased:function(e){
                    anim.rate = -1.0;
                    anim.play();
                }


            }
        ]}
    ]
}

Stage {
	width: w
	height: h
        title:"Image Blender"
	scene: scene = Scene {
                fill:LinearGradient {
                    startX : 0.0 startY : 0.0 endX : 0.0 endY : 1.0
                    stops: [
                        Stop {color : Color.BLACK offset: 0.0},
                        Stop {color : Color.GRAY offset: 1.0},
                    ]
                }
		content: [imgPanel, controls]
	}
}
