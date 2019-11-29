extends "res://ai/FiniteState.gd"

var FireBall = preload("res://enemies/Ghost/Fireball.tscn")

var animation_playing : bool
var position : Vector2

func reset():
	animation_playing = false

func update(object):
	position = object.position
	animation_playing = true
	object.velocity = Vector2(0, 0)
	object.get_node("AnimatedSprite").animation = "shriek"
	
	if object.damage:
		animation_playing = false
		emit_signal("pop")
		emit_signal("push", "HitState")
	elif object.live <= 0.0:
		animation_playing = false
		emit_signal("pop")
		emit_signal("push", "DieState")
	
	object.get_node("AnimatedSprite").play()

func _on_AnimatedSprite_animation_finished():
	if animation_playing:
		var fireball = FireBall.instance()
		fireball.position = self.position
		add_child(fireball)
		animation_playing = false
		emit_signal("pop")
		emit_signal("push", "HuntState")