extends "res://ai/FiniteState.gd"
	
func reset():
	pass

func update(object):
	if $Timer.is_stopped ():
		$Timer.start()

	object.get_node("AnimatedSprite").animation = "idle"
	
	object.velocity = object.fly_speed*(object.player.position - object.position).normalized()
	
	if object.damage:
		$Timer.stop()
		emit_signal("pop")
		emit_signal("push", "HitState")
	elif object.live <= 0.0:
		$Timer.stop()
		emit_signal("pop")
		emit_signal("push", "DieState")
	
	object.get_node("AnimatedSprite").play()

func _on_Timer_timeout():
	emit_signal("pop")
	emit_signal("push", "ShriekState")
