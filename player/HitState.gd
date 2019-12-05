extends "res://ai/FiniteState.gd"

var sound_played : bool
var current_count : int
var max_count : int = 5
	
func reset():
	current_count = 0
	sound_played = false

func update(object):
	object.get_node("AnimatedSprite").animation = "hurt"
	object.get_node("AnimatedSprite").play()
	
	if $Timer.is_stopped():
		$Timer.start()
		
	object.velocity = Vector2(0, 0)
	
	if current_count < max_count:
		object.modulate.a = 0.5 if current_count % 2 == 0 else 1.0
	else:
		$Timer.stop()
		object.damage = false
		current_count = 0
		object.modulate.a = 1.0
		if object.live <= 0.0:
			emit_signal("pop")
			emit_signal("push", "DieState")
		else:
			emit_signal("pop")
			emit_signal("push", "IdleState")

func _on_Timer_timeout():
	current_count += 1
