package localstore;
import javafx.io.Storage;
import java.io.InputStreamReader;
import java.io.BufferedReader;

var storage:Storage;

storage = Storage {
	source: "statecaps.txt"
}

var data = 
"Alaska:Juneau\n"
"Arizona:Phoenix\n"
"Arkansas:Little Rock\n"
"California:Sacramento\n"
"Colorado:Denver\n"
"Connecticut:Hartford\n"
"Delaware:Dover\n"
"Florida:Tallahassee\n"
"Georgia:Atlanta\n"
"Hawaii:Honolulu\n"
"Idaho:Boise\n"
"Illinois:Springfield\n"
"Indiana:Indianapolis\n"
"Iowa:Des Moines\n"
"Kansas:Topeka\n"
"Kentucky:Frankfort\n"
"Louisiana:Baton Rouge\n"
"Maine:Augusta\n"
"Maryland:Annapolis\n"
"Massachusetts:Boston\n"
"Michigan:Lansing\n"
"Minnesota:St. Paul\n"
"Mississippi:Jackson\n"
"Missouri:Jefferson City\n"
"Montana:Helena\n"
"Nebraska:Lincoln\n"
"Nevada:Carson City\n"
"New Hampshire:Concord\n"
"New Jersey:Trenton\n"
"New Mexico:Santa Fe\n"
"New York:Albany\n"
"North Carolina:Raleigh\n"
"North Dakota:Bismarck\n"
"Ohio:Columbus\n"
"Oklahoma:Oklahoma City\n"
"Oregon:Salem\n"
"Pennsylvania:Harrisburg\n"
"Rhode Island:Providence\n"
"South Carolina:Columbia\n"
"South Dakota:Pierre\n"
"Tennessee:Nashville\n"
"Texas:Austin\n"
"Utah:Salt Lake City\n"
"Vermont:Montpelier\n"
"Virginia:Richmond\n"
"Washington:Olympia\n"
"West Virginia:Charleston\n"
"Wisconsin:Madison\n"
"Wyoming:Cheyenne\n";

var res = storage.resource;
var output= res.openOutputStream(true);
output.write(data.getBytes());
output.close();

var input = res.openInputStream();
var reader = new BufferedReader(new InputStreamReader(input));
var line:String;
while((line = reader.readLine()) != null) {
	var record = line.split(":");
	println ("Capital of {record[0]} is {record[1]}");
} 	
