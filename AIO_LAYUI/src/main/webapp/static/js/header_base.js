function getRoot(){
    var basePath=document.domain;
    var http="http://";
    var port=":80";
    var path=http+basePath+port;
    return path;
}