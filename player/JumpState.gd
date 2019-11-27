extends "res://ai/FiniteState.gd"

var jmp_button_released : bool

func _ready():
	jmp_button_released = false

func update(object):
	object.get_node("AnimatedSprite").animation = "jump"
	
	if Input.is_action_just_released("ui_up"):
		jmp_button_released = true
	
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
		jmp_button_released = false
	elif Input.is_action_pressed("ui_up") and jmp_button_released:
		emit_signal("pop")
		emit_signal("push", "DoubleJumpState")
		object.velocity.y = -500
		jmp_button_released = false
	
	object.get_node("AnimatedSprite").play()