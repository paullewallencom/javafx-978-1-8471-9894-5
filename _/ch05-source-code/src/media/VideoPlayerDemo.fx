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

def w = 800;
def h = 600;
def maxW = w * 0.8;
def maxH = h * 0.7;
var scene:Scene;
def mediaSource = "http://mirror.bigbuckbunny.de/peach/bigbuckbunny_movies/big_buck_bunny_480p_h264.mov";

def player = MediaView{
    layoutX:(w - maxW)/2 layoutY:(h-maxH)/2
    mediaPlayer:MediaPlayer {media:Media{source:mediaSource}}
    fitWidth:maxW fitHeight:maxH
}

def controls = Group {
    layoutX:(w-110)/2
    layoutY:h-100
    effect:Reflection{fraction:0.4 bottomOpacity:0.1 topOffset:3}
    content:[
        HBox{spacing:10 content:[
            ImageView{
                id:"playCtrl" image:Image{url:"{__DIR__}play-large.png"}
                onMouseClicked:function(e:MouseEvent){
                    def playCtrl = e.source as ImageView;
                    if(not(player.mediaPlayer.status == MediaPlayer.PLAYING)){
                        playCtrl.image = Image{url:"{__DIR__}pause-large.png"}
                        player.mediaPlayer.play();
                    }else if(player.mediaPlayer.status == MediaPlayer.PLAYING){
                       playCtrl.image = Image{url:"{__DIR__}play-large.png"}
                       player.mediaPlayer.pause();
                    }
                }
            }
            ImageView{
                id:"stopCtrl" image:Image{url:"{__DIR__}stop-large.png"}
                onMouseClicked:function(e:MouseEvent){
                    def playCtrl = e.source as ImageView;
                    if(player.mediaPlayer.status == MediaPlayer.PLAYING){
                       playCtrl.image = Image{url:"{__DIR__}play-large.png"}
                       player.mediaPlayer.stop();
                    }
                }
            }
        ]}
    ]
}

Stage {
	title : "Video Player"
	scene: scene = Scene {
		width: w
		height: h
		content: [player, controls ]
	}
}
