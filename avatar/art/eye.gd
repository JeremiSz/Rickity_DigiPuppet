extends Node2D

@onready 
var origin : Vector2 = self.position;

func set_pos(a:Vector2,_b:Vector2,_c:Vector2,d:Vector2,_e:Vector2,_f:Vector2):
	var centre = (a + d)/2;
	self.position = (centre * 1000) + origin;
	return;
