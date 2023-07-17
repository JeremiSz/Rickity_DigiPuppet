extends MeshInstance3D

func set_pos(points:PackedVector2Array):
	handle_rotation(points[2],points[14],points[27],points[8],points[30]);
	return
	
func handle_rotation(pl:Vector2,pr:Vector2,pt:Vector2,pb:Vector2,pm:Vector2):
	var horizontal_distortion = (pm.x - pr.x) + (pl.x - pm.x);
	var verticle_distortion = (pm.y - pt.y) + (pb.y - pm.y);
	print(horizontal_distortion)
	print(verticle_distortion)
	
	self.rotation = Vector3(verticle_distortion,horizontal_distortion,0);
	return;
