extends Object
class_name WebSocketServer

var TCP_server = TCPServer.new()

func start(port : int):
	TCP_server.listen(port);
	return
	
func poll() -> WebSocketPeer:
	if TCP_server.is_connection_available():
		print("making connection")
		var websocket = WebSocketPeer.new();
		websocket.accept_stream(TCP_server.take_connection());
		return websocket;
	else:
		return null;
