extends "res://ai/FiniteState.gd"

var min_distance : float = 500.0
	
func reset():
	pass

func update(object):
	if $Timer.is_stopped ():
		$Timer.start()

	object.get_node("AnimatedSprite").animation = "idle"
	
	var dist_vec = object.player.position - object.position
	
	if dist_vec.length() > min_distance:
		object.velocity = object.fly_speed*dist_vec.normalized()
	else:
		object.velocity = Vector2(0, 0)
	
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
