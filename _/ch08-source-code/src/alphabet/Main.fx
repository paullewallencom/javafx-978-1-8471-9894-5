package alphabet;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import javafx.scene.input.KeyEvent;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.scene.paint.Color;

def w = 320;
def h = 240;
def imgW = 214;
def imgH = 182;

def alphabet = [
        "A", "B", "C", "D", "E", "F",
        "G", "H", "I", "J", "K", "L",
        "M", "N", "O", "P", "Q", "R",
        "S", "T", "U", "V", "W", "X",
        "Y", "Z"
];

var images:Image[];

for (letter in alphabet){
    insert Image {
        url: "{__DIR__}images/{letter}.png"
        backgroundLoading: false
        width:imgW height:imgH
    } into images;
}

var imgView = ImageView {
        x: (w - imgW)/2 y: (h - imgH)/2
        preserveRatio: true
	image:null
}

imgView.requestFocus();
imgView.onKeyPressed = function (e:KeyEvent) {
    imgView.image = {
        var img:Image = imgView.image;
        for(i in images){
            if(i.url.contains("{e.text}.png")) {
               img = i;
               break;
            }
        }
        img
    }
}

def prompt = Text {
    font : Font {
        size: 16
    }
    stroke:Color.BLACK
    content: "Type a letter to see it on screen"
}
prompt.x = (w - prompt.boundsInParent.width)/2;
prompt.y = h - 25;


Stage {
    title: "Alphabet"
    scene: Scene {
        width: w
        height: h
        content:[imgView,prompt]
    }
}
