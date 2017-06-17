//모듈 추출
var express = require('express');
var app = express();
var http = require('http');
var fs = require('fs');
var socketio = require('socket.io');

//웹 서버 만듦
var server = http.createServer(app);
server.listen("5200");
var emp_id;
var mem_nm;


//웹서버 만듦
/*var server = http.createServer(function(request,response){
	//HTMLPage.html 파일을 읽는다.
	console.log(request.param("emp_id"));
	fs.readFile('htmlPage.html', function(err, data) {
		
		response.writeHead(200, {'Content-Type': 'text/html'});
		response.end(data);
		
	});
}).listen(5200, function() {
	console.log('Server running at 5200');
	
});*/



app.get('/', function(request, response) {
	console.log("으아아");
	console.log("캬캬캬캬캬");
	emp_id = request.param("emp_id");
	response.sendfile(__dirname + '/htmlPage.html');
})

//소켓 서버를 만듦
var io = socketio.listen(server);
io.sockets.on('connection', function(socket) {
	//message 이벤트
	socket.on('message', function(data){
		//클라이언트의 message 이벤트를 발생시킴.
		io.sockets.emit('message', data);
	});
	
	socket.emit("adduser",emp_id);
	
});
