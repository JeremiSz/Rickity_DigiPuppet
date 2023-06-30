extends Node

var face_data : WebSocketServer;
var controller : WebSocketServer;

var has_face : bool = false;
var has_controller : bool = true;

func _ready():
	face_data = WebSocketServer.new();
	face_data.start(65001);
	controller = WebSocketServer.new();
	controller.start(65002);
	return;

func _process(_delta):
	if not has_face:
		var result = face_data.poll()
		if result != null:
			has_face = true;
			get_parent().face_pos_conn = result;
	if not has_controller:
		var result = controller.poll()
		if result != null:
			has_controller = true;
			get_parent().controller_conn = result;
	if has_controller and has_face:
		get_parent().set_process(true);
		get_parent().set_physics_process(true);
		set_process(false);
		self.queue_free();
	return;
	
