extends MeshInstance3D

const RANGE : Vector2 = Vector2.ONE * .5;

func set_pos(points:PackedVector2Array):
	#handle_rotation(points[2],points[14],points[27],points[8]);
	return
	
func handle_rotation(pl:Vector2,pr:Vector2,pt:Vector2,pb:Vector2):
	var horizontal_distortion = acos((pl.x - pr.x)/RANGE.x);
	var verticle_distortion = acos((pt.y - pb.y)/RANGE.y) - PI * .5;
	
	self.rotation = Vector3(0,horizontal_distortion,verticle_distortion);
	return;
