package fxzdemo;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.fxd.FXDNode;
import javafx.fxd.Duplicator;
import javafx.scene.text.Text;

def artwork = FXDNode {
    url: "{__DIR__}SymbolsAI.fxz"
    backgroundLoading: true
    placeholder: Text{ x:10 y: 10 content: "Loading..."}
}

Stage {
    title: "Object Loading"
    scene: Scene {
        width: 640
        height: 480
        content:[artwork]
    }
} 