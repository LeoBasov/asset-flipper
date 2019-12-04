extends "res://ai/FiniteState.gd"

var dying : bool
var dead : bool

func reset():
	dying = false
	dead = false

func update(object):
	dying = true
	object.get_node("AnimatedSprite").animation = "die"
	object.get_node("AnimatedSprite").play()
	
	if dead:
		dying = false
		dead = false
		object.dead()

func _on_AnimatedSprite_animation_finished():
	if dying:
		dying = false
		dead = true
