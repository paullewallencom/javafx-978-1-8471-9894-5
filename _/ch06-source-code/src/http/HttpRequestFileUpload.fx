package http;
import javafx.io.http.HttpRequest;
import javafx.io.http.HttpHeader;
import javafx.io.http.URLConverter;
import java.io.File;
import java.io.FileInputStream;
import java.io.BufferedInputStream;
import java.io.OutputStream;

def MARKER = "--";
def CRLF     = "\r\n";
def BOUNDARY = "7d226f700d0";
def CONTENT_TYPE = "multipart/form-data; boundary={BOUNDARY}";

class FormPart  {
    public-init var name:String;
    public var value:String;
    public var file:File;

    var conv = URLConverter{}

    public function writeFieldTo(out:OutputStream):Void {
        if(value != null){
            var data = new java.lang.StringBuilder();
            data
                .append(CRLF)
                .append(MARKER)
                .append(BOUNDARY)
                .append(CRLF)
                .append("Content-Disposition: form-data; name=\"{name}\"")
                .append(CRLF)
                .append(CRLF)
                .append(value);
            out.write(data.toString().getBytes());
        }
    }
    public function writeFileTo(out:OutputStream):Void {
        if(file != null){
            var header = new java.lang.StringBuilder();
            header
                .append(CRLF)
                .append(MARKER)
                .append(BOUNDARY)
                .append(CRLF)
                .append("Content-Disposition: form-data; name=\"{name}\"; filename=\"{file.getAbsolutePath()}\"")
                .append(CRLF)
                .append("Content-Type: application/octet-stream")
                .append(CRLF)
                .append(CRLF);
            out.write(header.toString().getBytes());

            // copy content to out stream
            var byteRead:Integer;
            var input = new FileInputStream(file);
            try{
                while ((byteRead = input.read()) != -1){
                    out.write(byteRead);
                }
            }finally{
                input.close();
            }
        }
    }
}

def url  = "http://localhost:8080/webapp/upload/save";
def file = new File("image.png");

var http:HttpRequest = HttpRequest {
    location: url
    method: HttpRequest.POST
    headers: [
        HttpHeader {name:HttpHeader.CONTENT_TYPE value:CONTENT_TYPE},
    ]

    onOutput:function(out: OutputStream){
        try {
            // write parts
            def filePart = FormPart{name:"file" file:file}
            filePart.writeFileTo(out);
            
            // close multipart
            var footer = new java.lang.StringBuilder();
            footer
                .append(CRLF)
                .append(MARKER)
                .append(BOUNDARY)
                .append(MARKER);
            out.write(footer.toString().getBytes());
        }finally{
            out.close();
        }
    }

    onWriting:function() {
        println ("Writing to server....");
        for(header in http.headers){
            println ("{header.name}: {header.value}")
        }

    }

    onDoneWrite:function() {
        println ("Finished writing")
    }

    onException:function(ex) {
        println ("Error {ex.getMessage()}");
    }

    onResponseCode:function(code:Integer){
        println ("Server RSP-CODE: {code}");
    }
}

http.start();

