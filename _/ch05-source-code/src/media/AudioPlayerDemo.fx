package media;

import javafx.scene.Group;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.media.MediaPlayer;
import javafx.scene.media.Media;
import javafx.scene.layout.HBox;
import javafx.scene.effect.Reflection;
import javafx.scene.media.MediaView;
import javafx.scene.input.MouseEvent;

def w = 400;
def h = 200;
var scene:Scene;
def mediaSource = "http://streaming.oracle.com/ebn/podcasts/media/8576726_Nandini_Ramani_030210.mp3";

def player = MediaPlayer {media:Media{source:mediaSource}}

def controls = Group {
    layoutX:(w-110)/2
    layoutY:(h-50)/2
    effect:Reflection{fraction:0.4 bottomOpacity:0.1 topOffset:3}
    content:[
        HBox{spacing:10 content:[
            ImageView{
                id:"playCtrl" image:Image{url:"{__DIR__}play-large.png"}
                onMouseClicked:function(e:MouseEvent){
                    def playCtrl = e.source as ImageView;
                    if(not(player.status == player.PLAYING)){
                        playCtrl.image = Image{url:"{__DIR__}pause-large.png"}
                        player.play();
                    }else if(player.status == player.PLAYING){
                       playCtrl.image = Image{url:"{__DIR__}play-large.png"}
                       player.pause();
                    }
                }
            }
            ImageView{
                id:"stopCtrl" image:Image{url:"{__DIR__}stop-large.png"}
                onMouseClicked:function(e){
                    def playCtrl = e.source as ImageView;
                    if(player.status == player.PLAYING){
                       playCtrl.image = Image{url:"{__DIR__}play-large.png"}
                       player.stop();
                    }
                }
            }
        ]}
    ]
}

Stage {
	title : "Audio Player"
	scene: scene = Scene {
		width: w
		height: h
		content: [ controls ]
	}
}
