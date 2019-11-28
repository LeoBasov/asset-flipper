extends "res://ai/FiniteState.gd"

var animation_running : bool

signal die

func _ready():
	reset()
	
func reset():
	animation_running = false

func update(object):
	animation_running = true
	object.get_node("AnimatedSprite").animation = "death"
	
	object.get_node("AnimatedSprite").play()

func _on_AnimatedSprite_animation_finished():
	if animation_running:
		animation_running =  false
		emit_signal("die")
