package controls;

import javafx.scene.control.ListView;
import javafx.scene.effect.DropShadow;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.paint.Color;

var w = 400;
var h = 200;

var listView = ListView {
	width:w-200
	height:h-50
	effect:DropShadow{offsetY:3 offsetX:3}
	items:  for (i in [1..50]) "Cloud {%5s i}"
}

listView.layoutX = (w - listView.width)/2;
listView.layoutY = (h - listView.height)/2;

Stage {
	width: w
	height: h
	scene: Scene {
                fill:LinearGradient {
                    startX: 0, endX: 0, startY: 0, endY: 1
                    stops: [
                        Stop { offset: 0, color: Color.GRAY }
                        Stop { offset: 1, color: Color.WHITESMOKE }
                    ]
                }
		content: [listView]
	}
}
