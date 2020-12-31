package js2jfxtypes;

import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.scene.text.Text;

var w=400;
var h=100;
var text:Text;

public function setObject(obj):Void{
    try{
        text.content = if(obj != null) "Received: {obj}" else "";
    }catch(e){
        text.content = "Received: {e}";
    }

}

public function setString(val:String):Void{
    try{
        text.content = "Received: {val}";
    }catch(e){
        text.content = "Received: {e}";
    }
}

public function setNumber(val:Number):Void{
    try{
        text.content = "Received: {val}";
    }catch(e){
        text.content = "Received: {e}";
    }
}

public function setInteger(val:Integer):Void{
    try{
        text.content = "Received: {val}";
    }catch(e){
        text.content = "Received: {e}";
    }
}

public function setBoolean(val:Boolean):Void{
    try{
        text.content = "Received: {val}";
    }catch(e){
        text.content = "Received: {e}";
    }
}

public function setSequence(val:String[]):Void{
    try{
        text.content = "Received: {val}";
    }catch(e){
        text.content = "Received: {e}";
    }
}


public function run() {
    text = Text {
        style: "fill:blue;"
            "font-family:\"Helvetica\";"
            "font-size:16pt;"
            "font-weight:bold;"
        translateY : bind text.boundsInLocal.height;
        //translateX : bind w/2 - (text.boundsInLocal.width/2);
    }
    
    setString("Ready...");

    Stage {
        title : "Type Converter"
        width: w
        height: h
        scene: Scene {
            width: 200
            height: 200
            content: bind text
        }
    }
}