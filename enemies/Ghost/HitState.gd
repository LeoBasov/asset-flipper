extends "res://ai/FiniteState.gd"

var current_count : int
var max_count : int = 50
	
func reset():
	current_count = 0

func update(object):
	if current_count < max_count:
		object.modulate.a = 0.5 if Engine.get_frames_drawn() % 2 == 0 else 1.0
		current_count += 1
	else:
		object.damage = false
		current_count = 0
		object.modulate.a = 1.0
		emit_signal("pop")
		emit_signal("push", "IdleState")