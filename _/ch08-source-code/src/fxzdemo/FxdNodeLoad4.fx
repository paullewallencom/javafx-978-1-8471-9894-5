package fxzdemo;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.fxd.FXDNode;
import javafx.fxd.Duplicator;
import javafx.scene.text.Text;
import javafx.fxd.FXDLoader;

def artwork:FXDNode = FXDNode {
    url: "{__DIR__}SymbolsAI.fxz"
    backgroundLoading: true
    placeholder: Text{ x:10 y: 10 content: "Loading..."}
    loader:FXDLoader{
        onStart:function() {
            println ("Image loading started")
        }
        onDone:function() {
            println ("Image loading done");
            println ("Loaded {sizeof artwork.getRoot().content} objects");
        }

    }
    
}


Stage {
    title: "Object Loading"
    scene: Scene {
        width: 640
        height: 480
        content:[artwork]
    }
} 