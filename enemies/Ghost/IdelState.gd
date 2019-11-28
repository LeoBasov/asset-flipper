extends "res://ai/FiniteState.gd"

func update(object):
	object.get_node("AnimatedSprite").animation = "idle"
	object.velocity.x = 0
	object.velocity.y = 0
	
	if object.damage:
		emit_signal("pop")
		emit_signal("push", "HitState")
	elif object.live <= 0.0:
		emit_signal("pop")
		emit_signal("push", "DieState")
	
	object.get_node("AnimatedSprite").play()