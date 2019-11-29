extends "res://ai/FiniteState.gd"

var animation_running : bool

signal die
	
func reset():
	animation_running = false

func update(object):
	object.velocity = Vector2(0, 0)
	object.collision_layer = 524288
	animation_running = true
	object.get_node("AnimatedSprite").animation = "death"
	
	object.get_node("AnimatedSprite").play()

func _on_AnimatedSprite_animation_finished():
	if animation_running:
		animation_running =  false
		emit_signal("die")
