extends "res://ai/FiniteState.gd"
	
func reset():
	pass

func update(object):
	object.get_node("AnimatedSprite").animation = "idle"
	
	object.velocity = object.fly_speed*(object.player.position - object.position).normalized()
	
	if object.damage:
		emit_signal("pop")
		emit_signal("push", "HitState")
	elif object.live <= 0.0:
		emit_signal("pop")
		emit_signal("push", "DieState")
	
	object.get_node("AnimatedSprite").play()