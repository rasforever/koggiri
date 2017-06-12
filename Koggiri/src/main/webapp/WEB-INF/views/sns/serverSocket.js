var fs = require('fs');
var http = require('http');
var socketio = require('socket.io');

function Sockets(){
	this.sockets = {};//배열을 만듦
}

Sockets.prototype.set = function(id, data){
	this.sockets[id] = data;//id값으로 데이터를 저장한다.
}

Sockets.prototype.get = function(id, callback){
	if(this.sockets[id] != undefined){
		callback(true, this.sockets[id]);
	}else{
		callback(false, this.sockets[id]);
	}
}

//웹서버 생성
var server = http.createServer(function(request, response){
	fs.readFile('htmlPage.html', function(error, data){
		response.writeHead('200', {'Content-Type' : 'text/html'});
		response.end(data);
	});
}).listen(5200, function(){
	console.log('Server running....');
});

//server Socket 생성
var roomList = [];
var io = socketio.listen(server);
var id = 0;
io.sockets.on('connection', function(socket){//io.sockets.onS 에서 sockets는 우리서버에 접속한 모든 socket을 뜻함.
	var sockets= new Sockets();//내가 만든것	
	console.log('connected...');
	
	socket.on('roomRequest', function(){//on을 통해 roomRequest이벤트를 받고 emit을 사용해 roomResponse이벤트를 보낸다(roomList배열도 보냄)
		io.sockets.emit('roomResponse', roomList);//roomList는 접속한 모든 방 리스트를 보여줌.
	});
	
	socket.on('create', function(data){
		roomList.push(data);
		io.sockets.emit('roomResponse', roomList);
	});	
	
	socket.on('join', function(data){
		socket.join(data);
		//sockets.set('room', data);
	});
	
	socket.on('message', function(data){
		io.sockets.in(data.room).emit('message', data);
		/*sockets.get('room', function(error, room){
			io.sockets.in(room).emit('message', data);
		});*/
	});
	
});

















