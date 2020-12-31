class UploadController {

    def index = { }

    def save = {
        def file = request.getFile("file");
        println "file name = ${file.getName()}";
        println "orig name = ${file.getOriginalFilename()}"
        println "file size = ${file.getSize()}"
        println "file avail= ${file.isAvailable()}"
    }
}
