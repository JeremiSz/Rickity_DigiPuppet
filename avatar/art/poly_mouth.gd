extends Polygon2D

var upper_indeices = PackedInt32Array([49,50,51,52,53,54,55,65,64,63,62,61,49]);
var lower_indeices = PackedInt32Array([49,61,68,67,66,65,55,56,57,58,59,60,49]);
var left_indeices = PackedInt32Array([37,38,39,40,41,42,37]);
var right_indeices = PackedInt32Array([43,44,45,46,47,48,43]);
@export var SCALE = 1000.0;

func set_upper_pos(points : Array[Vector2]):
	_set_verts(upper_indeices,points);
	return;
	
func set_lower_pos(points : Array[Vector2]):
	_set_verts(lower_indeices,points);
	return;

func set_right_pos(points : Array[Vector2]):
	_set_verts(right_indeices,points);
	return;
	
func set_left_pos(points : Array[Vector2]):
	_set_verts(left_indeices,points);
	return;
	
func _set_verts(indies:PackedInt32Array,points:Array):
	var verts : PackedVector2Array = PackedVector2Array()
	verts.resize(indies.size());
	for i in range(indies.size()):
		verts[i] = points[indies[i] - 1] * SCALE;
	self.polygon = verts;
	return;
