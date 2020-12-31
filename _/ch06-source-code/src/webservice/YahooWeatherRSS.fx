package webservice;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.text.Text;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.control.TextBox;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.layout.Tile;
import javafx.geometry.HPos;
import javafx.geometry.VPos;
import javafx.data.xml.QName;
import javafx.data.pull.PullParser;
import javafx.data.pull.Event;
import javafx.data.feed.rss.RssTask;
import javafx.data.feed.rss.Channel;
import javafx.data.feed.rss.Item;

var w = 240;
var h = 320;
class Weather {
    public var image:Image;
    public var title:String;
    public var city:String;
    public var region:String;
    public var country:String;
    public var condition:String;
    public var temp:String;
    public var windSpeed:String;
    public var humidity:String;
    public var visibility:String;
    public var pressure:String;
    public var sunsetTime:String;
    public var sunriseTime:String;

}

var zip = "33167";
var weather = Weather{};
var title:String;

function loadWeatherInfo(zip:String):Void {
    var rss:RssTask = RssTask {
        location: "http://weather.yahooapis.com/forecastrss?p={zip}";
        interval: 3s
        onItem:function (item: Item) {
           weather.title = item.title;
        }
        onChannel:function (ch:Channel){
           title = ch.title;
        }

        onForeignEvent:function(event:Event){
            if(event.type == PullParser.END_ELEMENT and event.qname.name.equals("location")){
                weather.city = event.getAttributeValue(QName{name:"city"});
                weather.region = event.getAttributeValue(QName{name:"region"});
                weather.country = event.getAttributeValue(QName{name:"country"});
           }
            if(event.type == PullParser.END_ELEMENT and event.qname.name.equals("condition")){
                weather.condition = event.getAttributeValue("text");
                weather.temp = event.getAttributeValue("temp");
                // assemble image
                var imgUrl = "http://l.yimg.com/a/i/us/we/52/{event.getAttributeValue("code")}.gif";
                weather.image = Image{url:imgUrl};
            }
            if(event.type == PullParser.END_ELEMENT and event.qname.name.equals("wind")){
                weather.windSpeed = event.getAttributeValue("speed")
            }
            if(event.type == PullParser.END_ELEMENT and event.qname.name.equals("atmosphere")){
                weather.visibility = event.getAttributeValue("visibility");
                weather.pressure = event.getAttributeValue("pressure");
                weather.humidity = event.getAttributeValue("humidity");
            }
            if(event.type == PullParser.END_ELEMENT and event.qname.name.equals("astronomy")){
                weather.sunriseTime = event.getAttributeValue("sunrise");
                weather.sunsetTime = event.getAttributeValue("sunset");
            }
        }


        onDone:function(){
            rss.stop();
        }

    }
    rss.start();
}


var weatherView = VBox {
    visible:false
    content : [
        Text {
            font : Font.font("Tahoma,Geneva,sans-serif", FontWeight.BOLD, 12)
            content: bind "Current Conditions"
            fill: Color.DARKBLUE
        },
        Text {
            font : Font.font("Tahoma,Geneva,sans-serif", FontWeight.BOLD, 18)
            content: bind "{weather.city}, {weather.region}"
            fill: Color.DARKBLUE
        },

        HBox {
            nodeVPos:VPos.CENTER
            content: [
                ImageView {
                    image: bind weather.image
                    fitHeight:75
                    preserveRatio:true
                },
                Text {
                    font : Font.font("Tahoma,Geneva,sans-serif", FontWeight.BOLD, 72)
                    content: bind "{weather.temp}{Character.toString(176)}"
                    fill: Color.DARKBLUE
                }
            ]
        },
        Text {
            font : Font.font("Tahoma,Geneva,sans-serif", FontWeight.BOLD, 18)
            content: bind "{weather.condition}"
            fill: Color.DARKBLUE
        },
        Tile {
            columns:2
            vgap:5
            nodeHPos: HPos.LEFT
            content :[
                Text {font:Font.font("sans-serif", FontWeight.BOLD, 10) content:"Humidity" fill:Color.DARKBLUE},
                Text {font:Font.font("sans-serif", 10) content:bind weather.humidity fill:Color.DARKBLUE},
                Text {font:Font.font("sans-serif", FontWeight.BOLD, 10) content:"Barometer" fill:Color.DARKBLUE},
                Text {font:Font.font("sans-serif", 10) content:bind weather.pressure fill:Color.DARKBLUE},
                Text {font:Font.font("sans-serif", FontWeight.BOLD, 10) content:"Wind Speed" fill:Color.DARKBLUE},
                Text {font:Font.font("sans-serif", 10) content:bind weather.windSpeed fill:Color.DARKBLUE}
                Text {font:Font.font("sans-serif", FontWeight.BOLD, 10) content:"Sunrise" fill:Color.DARKBLUE},
                Text {font:Font.font("sans-serif", 10) content:bind weather.sunriseTime fill:Color.DARKBLUE}
                Text {font:Font.font("sans-serif", FontWeight.BOLD, 10) content:"Sunset" fill:Color.DARKBLUE},
                Text {font:Font.font("sans-serif", 10) content:bind weather.sunsetTime fill:Color.DARKBLUE}
            ]
        },
        
    ]
}


var zipCtrl:TextBox = TextBox {
    promptText:"Enter Zip"
    translateX:10
    translateY: h - 50
    action:function() {
        loadWeatherInfo(zipCtrl.text);
        weatherView.visible = true;
    }
}

zipCtrl.text = zip;
loadWeatherInfo(zip);
weatherView.visible = true;

var stage = Stage {
	width: w
	height: h
	scene: Scene {
		fill: LinearGradient {
                    startX:0 startY:0
                    endX:0 endY:1
                    proportional:true
                    stops: [
                        Stop{offset: 0.25 color:Color.WHITE}
                        Stop{offset:0.75 color:Color.BLUE}
                    ]
                }

		content: [
                    weatherView,
                    zipCtrl
                ]
	}
}




