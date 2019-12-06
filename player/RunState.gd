extends "res://ai/FiniteState.gd"

func update(object):
	object.get_node("AnimatedSprite").animation = "run"
	object.get_node("AnimatedSprite").play()
	
	if object.damage:
		emit_signal("pop")
		emit_signal("push", "HitState")
	
	if Input.is_action_pressed("ui_up"):
		emit_signal("pop")
		emit_signal("push", "JumpState")
		object.velocity.y = -500
	elif Input.is_action_pressed("ui_select"):
		object.velocity = Vector2(0, 0)
		emit_signal("pop")
		emit_signal("push", "Attack2State")
	elif Input.is_action_pressed("ui_left"):
		object.get_node("AnimatedSprite").flip_h = true
		object.velocity.x = -object.WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		object.get_node("AnimatedSprite").flip_h = false
		object.velocity.x = object.WALK_SPEED
	else:
		emit_signal("pop")
		emit_signal("push", "IdleState")
		
	if object.velocity.y > 0:
		emit_signal("pop")
		emit_signal("push", "FallState")