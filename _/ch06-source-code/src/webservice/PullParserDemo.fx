package webservice;
import java.io.ByteArrayInputStream;
import javafx.data.xml.QName;
import javafx.data.pull.PullParser;

var xml = "<?xml version=\"1.0\" encoding=\"utf-8\" ?>"
"<SearchResults:searchresults xmlns:SearchResults=\"http://www.zillow.com/vstatic/3/static/xsd/SearchResults.xsd\">"
"<response><results><result>"
"<zpid>48749425</zpid>"
"<address><street>2114 Bigelow Ave N</street><zipcode>98109</zipcode><city>SEATTLE</city><state>WA</state>"
"<latitude>47.637934</latitude><longitude>-122.347936</longitude></address>"
"<zestimate><amount currency=\"USD\">1241162</amount><last-updated>10/25/2007</last-updated></zestimate>"
"</result></results></response>"
"</SearchResults:searchresults>";

var parser = PullParser {
    input: new ByteArrayInputStream(xml.getBytes());
    onEvent: function(event: javafx.data.pull.Event){
        println ("Processing EVENT {event.typeName}")
    }
}

var street = parser.seek(QName{name:"address"}).forward(2).event.text;
println (street);

