package fxzdemo;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.Node;
import javafx.scene.input.KeyEvent;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyCode;
import javafx.fxd.FXDLoader;

def w = 640;
def h = 200;

def artwork = FXDLoader.loadContent("{__DIR__}SymbolsPS.fxz");
def symbols = artwork.getRoot();

def triangle = artwork.getNode("triangle") as ImageView;
def target = artwork.getNode("target") as ImageView;

target.x = triangle.x;
symbols.requestFocus();
symbols.onKeyPressed = function (e:KeyEvent) {
    if(e.code.equals(KeyCode.VK_RIGHT)){
        target.translateX = target.translateX + 15;
        triangle.translateX = triangle.translateX + 15;
    }
    if(e.code.equals(KeyCode.VK_LEFT)){
        target.translateX = target.translateX - 15;
        triangle.translateX = triangle.translateX - 15;
    }
    if(e.code.equals(KeyCode.VK_SPACE)){
        for(i in [0..5]){
            var icon = artwork.getNode("icon_{i}") as Node;
            if(icon.intersects(target.boundsInParent)){
                icon.visible = false;
                break;
            }
        }
    }
}

Stage {
    title: "Targeting"
    scene: Scene {
        width: w
        height: h
        content:[symbols]
    }
}