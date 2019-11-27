extends "res://ai/FiniteState.gd"

func update(object):
	object.get_node("AnimatedSprite").animation = "jump"
	
	if object.velocity.y >=0.0:
		emit_signal("pop")
		emit_signal("push", "FallState")
	
	object.get_node("AnimatedSprite").play()