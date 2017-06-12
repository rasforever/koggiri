//모듈 추출
var http = require('http');
var fs = require('fs');
var socketio = require('socket.io');

//웹서버 만듦
var server = http.createServer(function(request,response){
	//HTMLPage.html 파일을 읽는다.
	fs.readFile('HTMLPage.html', function(err, data) {
		
		response.writeHead(200, {'Content-Type': 'text/html'});
		response.end(data);
		
	});
}).listen(52273, function() {
	console.log('Server running at http://127.0.0.1:52273');
	
});

//소켓 서버를 만듦
var io = socketio.listen(server);
io.sockets.on('connection', function(socket) {
	//message 이벤트
	socket.on('message', function(data){
		//클라이언트의 message 이벤트를 발생시킴.
		io.sockets.emit('message', data);
	});
	
});
