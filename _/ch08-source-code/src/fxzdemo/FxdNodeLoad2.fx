package fxzdemo;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.fxd.FXDNode;
import javafx.fxd.Duplicator;

def artwork = FXDNode{url:"{__DIR__}SymbolsAI.fxz"}

def flare = Duplicator.duplicate(artwork.getGroup("flare"));

Stage {
    title: "Object Loading"
    scene: Scene {
        width: 200
        height: 200
        content:[flare]
    }
}