extends Node

var face_pos_conn : WebSocketPeer=null;
var controller_conn: WebSocketPeer = null;

@onready var eye_l = $"eye_l";
@onready var eye_r = $"eye_r";
@onready var mouth = $"mouth";

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
		set_process(false) # Stop processing.
		
func handle_points(coords:PackedFloat32Array):
	#print(typeof(points));
	#print(len(points))
	#print(points)
	var points = PackedVector2Array()
	points.resize(68);
	for  i in range(0,coords.size(),2):
		points[int(i)/2] = Vector2(coords[i],coords[i+1]) * 2 - Vector2.ONE;
		
	eye_l.set_pos(points[37],points[38],points[39],points[40],points[41],points[42]);
	eye_r.set_pos(points[46],points[45],points[44],points[43],points[48],points[47]);
	mouth.set_pos(points[49],points[55]);
	return;
