package media;

import javafx.scene.Group;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.media.MediaPlayer;
import javafx.scene.media.Media;
import javafx.scene.layout.HBox;
import javafx.scene.input.MouseEvent;
import javafx.scene.effect.Reflection;
import javafx.scene.shape.Circle;
import javafx.scene.paint.Color;
import javafx.scene.shape.Line;
import javafx.scene.text.Text;
import javafx.scene.text.TextAlignment;
import javafx.scene.text.TextOrigin;
import javafx.scene.text.Font;
import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.media.MediaView;

class MediaController extends CustomNode{
    public var mediaPlayer:MediaPlayer;
    public var showReflection:Boolean = false;

    var timestat = bind
        "{%02d mediaPlayer.currentTime.toHours()      mod 12 as Integer}:"
        "{%02d mediaPlayer.currentTime.toMinutes()    mod 60 as Integer}:"
        "{%02d mediaPlayer.currentTime.toSeconds()    mod 60 as Integer}/"
        "{%02d mediaPlayer.media.duration.toHours()   mod 12 as Integer}:"
        "{%02d mediaPlayer.media.duration.toMinutes() mod 60 as Integer}:"
        "{%02d mediaPlayer.media.duration.toSeconds() mod 60 as Integer}";

    def imgReverse = Image{url:"{__DIR__}reverse-small.png"};
    def imgPlay = Image{url:"{__DIR__}play-small.png"};
    def imgPause = Image{url:"{__DIR__}pause-small.png"};
    def imgFfwd = Image{url:"{__DIR__}ffwd-small.png"};
    def imgVolup = Image{url:"{__DIR__}volup-small.png"}
    def imgVolDn = Image{url:"{__DIR__}voldown-small.png"};

    def controls = Group {
        effect:if(showReflection) Reflection{fraction:0.3} else null;
        content:[
            HBox{spacing:10 content:[
                ImageView{
                    id:"reverseCtrl" image:imgReverse
                    onMousePressed:function(e:MouseEvent){
                        mediaPlayer.currentTime = mediaPlayer.currentTime
                          - (mediaPlayer.media.duration * 0.01);
                    }
                }
                ImageView{
                    id:"playCtrl" image:imgPlay
                    onMouseClicked:function(e:MouseEvent){
                        def playCtrl = e.source as ImageView;
                        if(not(mediaPlayer.status == MediaPlayer.PLAYING)){
                            playCtrl.image = imgPause;
                            mediaPlayer.play();
                        }else if(mediaPlayer.status == mediaPlayer.PLAYING){
                           playCtrl.image = imgPlay;
                           mediaPlayer.pause();
                        }
                    }
                }
                ImageView{
                    id:"ffwdCtrl" image:imgFfwd
                    onMousePressed:function(e:MouseEvent){
                        mediaPlayer.currentTime = mediaPlayer.currentTime
                          + (mediaPlayer.media.duration * 0.01);
                    }
                }
                ImageView{
                    id:"voldn" image:imgVolDn;
                    onMouseClicked:function(e){
                        mediaPlayer.volume = mediaPlayer.volume - 0.4;
                    }
                }

                ImageView{
                    id:"volup" image:imgVolup
                    onMouseClicked:function(e){
                        mediaPlayer.volume = mediaPlayer.volume + 0.4;
                    }
                }

            ]}

            Line{startX:0 startY:40 endX:100 endY:40 stroke:Color.MAROON}
            Circle{
                radius:5
                fill:Color.MAROON
                centerX:bind if(mediaPlayer.media.duration > 0ms)
                    (mediaPlayer.currentTime/mediaPlayer.media.duration)*100
                else 5
                centerY:40

            }
            Text{
                x:105 y:35
                textAlignment:TextAlignment.LEFT
                textOrigin:TextOrigin.TOP
                font:Font.font("Sans Serif", 10)
                content: bind timestat
            }

        ]
    }

    override protected function create () : Node {
        return controls
    }
}



def w = 800;
def h = 600;
def maxW = w * 0.8;
def maxH = h * 0.7;
var scene:Scene;
def mediaSource = "http://mirror.bigbuckbunny.de/peach/bigbuckbunny_movies/big_buck_bunny_480p_h264.mov";

def video = MediaView{
    layoutX:(w - maxW)/2 layoutY:(h-maxH)/2
    mediaPlayer:MediaPlayer {media:Media{source:mediaSource}}
    fitWidth:maxW fitHeight:maxH
}


def controls = MediaController {
    mediaPlayer: video.mediaPlayer
    showReflection:true
    layoutX: (w - 200)/2 layoutY:video.fitHeight + 50
}


Stage {
	title : "Video Player"
	scene: scene = Scene {
		width: w
		height: h
		content: [ video, controls ]
	}
}
