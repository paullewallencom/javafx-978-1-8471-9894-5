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

def w = 800;
def h = 600;
var scene:Scene;
def maxW = w * 0.9;
def maxH = h * 0.9;

def imgView:ImageView = ImageView{
    preserveRatio:true
    fitWidth: maxW
    fitHeight:maxH
    layoutX:(w-maxW)/2 layoutY:(h-maxH)/2
};

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



Stage {
	title : "Image Browser"
	scene: scene = Scene {
                fill:Color.BLACK
		width: w
		height: h
		content: [imgView, addrBar ]
	}
}
