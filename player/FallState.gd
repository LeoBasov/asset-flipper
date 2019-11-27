extends "res://ai/FiniteState.gd"

func update(object):
	object.get_node("AnimatedSprite").animation = "fall"
	
	if object.velocity.y == 0.0:
		emit_signal("pop")
		emit_signal("push", "IdleState")
	
	object.get_node("AnimatedSprite").play()