extends KinematicBody2D

var alive : bool

func _ready():
	reset()
	
func reset():
	alive = true
	$AnimatedSprite.animation = "idle"
	collision_layer = 2
	collision_mask = 1
	show()

func _process(delta):
	$AnimatedSprite.play()
	
func hit():
	die()
		
func die():
	collision_layer = 20
	collision_mask = 20
	$AnimatedSprite.animation = "death"
	alive = false

func _on_AnimatedSprite_animation_finished():
	if !alive:
		hide()