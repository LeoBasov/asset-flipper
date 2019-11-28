extends "res://ai/FiniteState.gd"

var animation_running : bool

func _ready():
	animation_running  = false

func update(object):
	animation_running = true
	object.get_node("AnimatedSprite").animation = "attack-2"
	
	if object.get_node("AnimatedSprite").frame == 3:
		print(object.get_node("AnimatedSprite").frame)
	
	object.get_node("AnimatedSprite").play()

func _on_AnimatedSprite_animation_finished():
	if animation_running:
		animation_running = false
		emit_signal("pop")
		emit_signal("push", "IdleState")
