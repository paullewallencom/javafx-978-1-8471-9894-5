package http;
import javafx.io.http.HttpRequest;
import javafx.io.http.URLConverter;
import java.io.BufferedReader;
import java.io.InputStreamReader;

var conv = URLConverter{};
var topic = conv.encodeString("Java_(programming_language)");
var url = "http://en.wikipedia.org/wiki/JavaFX";

var http = HttpRequest {
    location: url
    method: HttpRequest.GET

    onStarted: function() {println("HttpRequest started");}
    onConnecting: function() { println("Waiting for connection...") }
    onDoneConnect: function() { println("Connected") }
    onReadingHeaders: function() { println("Retrieving headers") }
    onResponseCode: function(httpCode:Integer) { println("Response Status: {httpCode}") }
    onResponseMessage: function(msg:String) { println("Response Message: {msg}") }
    onReading: function() { println("Receiving...") }

    onRead: function(totalBytes: Long) {
        println ("Total bytes received: {totalBytes}")
    }

    onInput: function(in: java.io.InputStream) {
        if(in.available() > 0){
            println ("Printing result from {url}");
            var reader:BufferedReader;
            try{
                reader = new BufferedReader(new InputStreamReader(in));
                var line;
                while((line = reader.readLine()) != null){
                    println(line)
                }
            }finally{
                reader.close();
                in.close();
            }
        }
    }

    onDoneRead: function() { println("Finished Receiving") }
    onDone: function() { println("Response Done") }
    onException: function(ex: java.lang.Exception) {
        println("Error detected: {ex.getMessage()}");
    }
}

http.start();

