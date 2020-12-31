
package webservice;

import javafx.data.pull.PullParser;
import javafx.io.http.HttpRequest;
import javafx.io.http.URLConverter;
import javax.imageio.ImageIO;
import javafx.scene.image.ImageView;
import javafx.scene.effect.Reflection;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.paint.Color;
import javafx.ext.swing.SwingUtils;
import javafx.scene.layout.HBox;
import javafx.scene.control.TextBox;
import javafx.scene.control.Button;
import javafx.geometry.HPos;
import javafx.geometry.VPos;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.Stack;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Text;

def w = 640;
def h = 480;
def imgW = w * 0.7;
def imgH = h * 0.6;

def ZILLOW_WS = "http://www.zillow.com/webservice/GetSearchResults.htm";
def ZILLOW_ZID = "X1-ZWz1c4pb4kkzkb_8s1xw";
def GOOGLE_WS = "http://maps.google.com/maps/api/staticmap";
def GOOGLE_KEY = "ABQIAAAAoV_CwkR1mUp9sySrirk9bhTGEj6WCqbisms9t6IYmZa6uZglnxSkAem-0jBpzcxB4JN0nrBXwhM7gQ";
def DEFAULT_ADDR  = createAddress("1600 Pennsylvania Ave, Washington DC");

def conv = URLConverter{};

var scene:Scene;
var imgView:ImageView;

// Address model
class Address {
    public var street:String;
    public var city:String;
    public var state:String;
    public var zip:String;
    override public function toString(){
        return "{street}, "
               "{city} {state} {zip}";
    }
}

// Zillow Listing Model
class ZillowListing extends Address{
    public var zpid:String;
    public var longitude:String;
    public var latitude:String;
    public var zestimate:Number;
    override public function toString(){
        return "[zpid:{zpid}, "
               "long:{longitude}, "
               "lat:{latitude}, "
               "addr:{street}, "
               "{city} {state} {zip},"
               " zestimate:{zestimate}]"
    }
}

// stores listing request
def zl = ZillowListing{}

// retrieves the zillow listing for given address
function getZListing(addr:Address){
    def citystatezip = "{addr.city} {addr.state} {addr.zip}";
    var url = bind "{ZILLOW_WS}?zws-id={ZILLOW_ZID}&"
        "address={conv.encodeString(addr.street)}&"
        "citystatezip={conv.encodeString(citystatezip)}";

    var parser = PullParser {
        documentType:PullParser.XML
        onEvent: function(event:javafx.data.pull.Event){
            if(event.type == PullParser.END_ELEMENT){
                if(event.qname.name == "zpid"){
                    zl.zpid = event.text;
                }
                if(event.qname.name == "longitude"){
                    zl.longitude = event.text;
                }
                if(event.qname.name == "latitude"){
                    zl.latitude = event.text;
                }
                if(event.qname.name == "street"){
                    zl.street  = event.text;
                }
                if(event.qname.name == "city"){
                    zl.city  = event.text;
                }
                if(event.qname.name == "state"){
                    zl.state  = event.text;
                }
                if(event.qname.name == "zip"){
                    zl.zip  = event.text;
                }
                if(event.qname.name == "amount"){
                    zl.zestimate = Number.parseFloat(event.text);
                }
            }
        }
    }

    var http:HttpRequest = HttpRequest {
        method: HttpRequest.GET
        location : url
        onInput:function(in:java.io.InputStream){
             try{
                parser.input = in;
                parser.parse();
            }finally{
                in.close();
            }
        }
        onDone:function(){
            http.stop();
        }
    }
    http.start();
}

function getGMap(addr:Address){
    var loc = "{addr.street}, {addr.city} {addr.state} {addr.zip}";
    var url = bind "{GOOGLE_WS}?"
		   "center={conv.encodeString(loc)}"
		   "&zoom=13"
		   "&size={imgW as Integer}x{imgH as Integer}"
		   "&maptype=map"
		   "&format=png32"
                   "&markers=color:blue|{conv.encodeString(loc)}"
		   "&sensor=false"
		   "&key={GOOGLE_KEY}";

    var http:HttpRequest = HttpRequest {
        location: url;
        onInput: function(is: java.io.InputStream) {
            try {
                if(is.available() > 0) {
                    var buffImg = ImageIO.read(is);
                    imgView.image = SwingUtils.toFXImage(buffImg);
                }
            } finally {
                is.close();
            }
        }

        //onToRead:function(toRead:Long) {bytesToRead = toRead}
        //onRead:function(bytes:Long){currentBytesRead = bytes}

        onException: function(ex: java.lang.Exception) {
            println("onException - exception: {ex.getClass()} {ex.getMessage()}");
        }

        onDone: function() {http.stop();}
    };
    http.start();
}

function createAddress(address:String):Address {
    var result = Address{};
    var addrParts = address.split(",");
    result.street = addrParts[0].trim();
    if(sizeof addrParts == 2){
        var subparts = addrParts[1].trim().split("\\s");
        result.city = subparts[0];
        result.state = subparts[1];
    }
    if(sizeof addrParts == 3){
        var subparts = addrParts[1].trim().split("\\s");
        result.city = subparts[0];
        result.state = subparts[1];
        result.zip = addrParts[2];
    }
    result;
}

var zDialog:Stack = Stack{
    nodeHPos:HPos.CENTER
    nodeVPos:VPos.CENTER
    content:[
        Rectangle {
            width: w * 0.6 height: h * 0.3
            arcHeight:10 arcWidth:10
            opacity: 0.75
            fill:Color.LIGHTSKYBLUE stroke:Color.BLUE strokeWidth:2
            onMouseClicked:function(e:javafx.scene.input.MouseEvent){
                zDialog.visible = false;
            }

        }
        Text {
            content:bind "Zillow ID {zl.zpid}:\n"
                    "Address: {zl.street}, {zl.city} {zl.state} {zl.zip}\n"
                    "Long {zl.longitude} / Lat: {zl.latitude}\n"
                    "Zestimate: ${%,.2f zl.zestimate}";

        }
    ]
    layoutX: (w - (w * 0.6))/2;
    layoutY: 40;
    visible:false
}

imgView = ImageView{
    preserveRatio:true
    effect: Reflection{fraction:0.25}
    layoutX:(w-imgW)/2 layoutY:20
};

def controls = HBox{
        layoutY:h - 100
        width:w spacing:10 nodeVPos:VPos.CENTER hpos:HPos.CENTER
        content:[
            TextBox{id:"addr" columns:50 text:DEFAULT_ADDR.toString()}
            Button{text:"Lookup" action:function(){
                def addr = (scene.lookup("addr") as TextBox).text;
                getGMap(createAddress(addr));
            }}
            Button{text:"ZillowIt" action:function(){
                def addr = (scene.lookup("addr") as TextBox).text;
                getZListing(createAddress(addr));
                zDialog.visible = true;
            }}
        ]
}


getGMap(DEFAULT_ADDR);


var stage = Stage {
	width: w
	height: h
        title:"Zillow Mashup"
	scene:scene = Scene {
		fill:Color.BLACK
		content: [imgView, controls, zDialog]
	}
}
