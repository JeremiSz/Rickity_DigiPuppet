extends Node

var face_pos_conn : WebSocketPeer=null;
var controller_conn: WebSocketPeer = null;

@onready
var mesh : MeshInstance3D = $"head";

func _ready():
	set_process(false);
	set_physics_process(false);
	return;

func _physics_process(_delta):
	face_pos_conn.poll()
	var state = face_pos_conn.get_ready_state()
	if state == WebSocketPeer.STATE_OPEN:
		var packet;
		while face_pos_conn.get_available_packet_count():
			packet = face_pos_conn.get_packet();
		if packet != null:
			handle_points(packet.to_float32_array());
	elif state == WebSocketPeer.STATE_CLOSING:
		# Keep polling to achieve proper close.
		pass
	elif state == WebSocketPeer.STATE_CLOSED:
		var code = face_pos_conn.get_close_code()
		var reason = face_pos_conn.get_close_reason()
		print("WebSocket closed with code: %d, reason %s. Clean: %s" % [code, reason, code != -1])
		set_physics_process(false) # Stop processing.
		
func handle_points(coords:PackedFloat32Array):
	#print(typeof(points));
	#print(len(points))
	#print(points)
	var points = PackedVector2Array()
	points.resize(68);
	for  i in range(0,coords.size(),2):
		points[int(i)/2] = Vector2(coords[i],coords[i+1]) * 2 - Vector2.ONE;
		
	mesh.set_pos(points);
	return;
