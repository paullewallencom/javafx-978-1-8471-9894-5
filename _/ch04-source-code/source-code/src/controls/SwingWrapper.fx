package controls;

import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.ext.swing.SwingLabel;
import javafx.ext.swing.SwingTextField;
import javafx.ext.swing.SwingComboBox;
import javafx.ext.swing.SwingComboBoxItem;
import javafx.ext.swing.SwingButton;
import javafx.scene.layout.Tile;
import javafx.stage.Alert;

var w = 640;
var h = 480;

var ctrl = Tile {
	rows:4
	columns:2
	tileWidth:200
	content:[
		SwingLabel {text: "Name"},
		SwingTextField{text:"Enter name" columns:25},
		SwingLabel {text: "Position"},
		SwingTextField{text:"Enter postion" columns:15},
		SwingLabel {text: "Title"},
		SwingComboBox{
			items: [
				SwingComboBoxItem{text:"President"},
				SwingComboBoxItem{text:"Director"},
				SwingComboBoxItem{text:"Manager"},
				SwingComboBoxItem{text:"Staff"}
			]
		},
		SwingButton{
			text:"Submit" 
			action:function():Void{Alert.inform("Thank you.");}
		}
	]
}

ctrl.translateX = (w - ctrl.boundsInLocal.width)/2;
ctrl.translateY = (h - ctrl.boundsInLocal.height)/2;

Stage {
	width: w
	height: h
	scene: Scene {
		content: [ctrl]
	}
}
