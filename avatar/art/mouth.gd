extends Node2D

@onready 
var origin : Vector2 = self.position;

func set_pos(a:Vector2,b:Vector2):
	var centre = (a + b)/2;
	self.position = (centre * 1000) + origin;
	return;
