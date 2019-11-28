extends KinematicBody2D

var alive : bool

func _ready():
	reset()
	
func reset():
	alive = true
	$AnimatedSprite.animation = "idle"
	collision_layer = 2
	show()

func _process(delta):
	$AnimatedSprite.play()
	
func hit():
	die()
		
func die():
	collision_layer = 524288 #layer 20 = pow(2, 19)
	$AnimatedSprite.animation = "death"
	alive = false

func _on_AnimatedSprite_animation_finished():
	if !alive:
		hide()