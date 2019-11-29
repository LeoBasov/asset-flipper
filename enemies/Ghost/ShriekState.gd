extends "res://ai/FiniteState.gd"

var animation_playing : bool

func reset():
	animation_playing = false

func update(object):
	animation_playing = true
	object.velocity = Vector2(0, 0)
	object.get_node("AnimatedSprite").animation = "shriek"
	
	if object.damage:
		emit_signal("pop")
		emit_signal("push", "HitState")
	elif object.live <= 0.0:
		emit_signal("pop")
		emit_signal("push", "DieState")
	
	object.get_node("AnimatedSprite").play()

func _on_AnimatedSprite_animation_finished():
	if animation_playing:
		animation_playing = false
		emit_signal("pop")
		emit_signal("push", "HuntState")