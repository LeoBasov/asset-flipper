extends "res://ai/FiniteState.gd"

var jump_sound_played : bool
	
func reset():
	jump_sound_played = false

func update(object):
	if !jump_sound_played:
		$JumpSound2.play()
		jump_sound_played = true
	
	object.get_node("AnimatedSprite").animation = "double_jump"
	
	if object.velocity.y >=0.0:
		emit_signal("pop")
		emit_signal("push", "FallState")
		reset()
	
	object.get_node("AnimatedSprite").play()