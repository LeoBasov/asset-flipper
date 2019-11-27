extends "res://ai/FiniteState.gd"

func update(object):
	object.get_node("AnimatedSprite").animation = "jump"
	
	if Input.is_action_pressed("ui_left"):
		object.get_node("AnimatedSprite").flip_h = true
		object.velocity.x = -object.WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		object.get_node("AnimatedSprite").flip_h = false
		object.velocity.x = object.WALK_SPEED
	else:
		object.velocity.x = 0.0
	
	if object.velocity.y >=0.0:
		emit_signal("pop")
		emit_signal("push", "FallState")
	
	object.get_node("AnimatedSprite").play()