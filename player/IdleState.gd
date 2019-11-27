extends "res://ai/FiniteState.gd"

func update(object):
	object.get_node("AnimatedSprite").animation = "idle"
	object.velocity.x = 0
	
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		emit_signal("pop")
		emit_signal("push", "RunState")
	elif Input.is_action_pressed("ui_up"):
		emit_signal("pop")
		emit_signal("push", "JumpState")
		object.velocity.y = -500
		
	object.get_node("AnimatedSprite").play()