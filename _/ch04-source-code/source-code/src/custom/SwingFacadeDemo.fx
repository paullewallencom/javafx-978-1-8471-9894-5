package custom;

import javafx.ext.swing.SwingComponent;
import javax.swing.JComponent;
import javax.swing.JButton;
import javax.swing.JPopupMenu;
import javax.swing.JMenuItem;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javafx.scene.layout.HBox;
import javafx.stage.Alert;
import javafx.stage.Stage;
import javafx.scene.Scene;

class PopupMenu extends SwingComponent {
    var button:JButton;
    var menu:JPopupMenu;

    // set button title
    public var text:String = "Menu" on replace {
        button.setText(text);
    };
	
    // sets menuItems property
    public-init var items:MenuItem[] on replace old[lo..hi] = newMenuItems {
        menu.removeAll();
        for(item in newMenuItems){
            addItemToPopup(item.title, item.action);
        }
    };

    // must override to return node
    override function createJComponent():JComponent{
        button = new JButton();
        menu = new JPopupMenu();
        menu.setBorderPainted(true);
		
        button.addActionListener(ActionListener{
            public override function actionPerformed(e:ActionEvent) {
                menu.show(button, 0,button.getHeight()-5);
            }
        });
		
        button;
    }

    // add item to popmenu and setsup action handler for each item
    function addItemToPopup(label:String, itemAction:function():Void) {
        def item = new JMenuItem(label);
        item.addActionListener(ActionListener {
            public override function actionPerformed(e:ActionEvent) {
                button.setText((e.getSource() as JMenuItem).getText());
		itemAction();
	    }
        });
        menu.add(item);
    }
	
}

// represents a menu item in the popup menu
class MenuItem {
    public var title:String = "Untitled Menu";
    public var action:function():Void;
}

// using the popup menu
var menu = HBox {
    content: [
        PopupMenu{
            items:[
                MenuItem{title:"Hello!", action:function(){Alert.inform("Hi!");}}
                MenuItem{title:"How are you?", action:function(){Alert.inform("Fine, thanks.");}}
                MenuItem{title:"Good bye!", action:function(){Alert.inform("Later!");}}
            ]
        }
     ]
}

Stage {
	title : "MyApp"
	scene: Scene {
		width: 200
		height: 200
		content: [ menu ]
	}
}
