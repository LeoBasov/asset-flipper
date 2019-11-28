extends KinematicBody2D

var alive : bool
var damage : bool
var max_count : int = 50
var current_count : int

func _ready():
	reset()
	
func reset():
	current_count = 0
	damage = false
	alive = true
	$AnimatedSprite.animation = "idle"
	collision_layer = 2
	show()

func _process(delta):
	$AnimatedSprite.play()
	
	if damage and (current_count < max_count):
		self.modulate.a = 0.5 if Engine.get_frames_drawn() % 2 == 0 else 1.0
		current_count += 1
	elif damage:
		die()
		damage = false
		current_count = 0
		self.modulate.a = 1.0
	
func hit():
	damage = true
		
func die():
	collision_layer = 524288 #layer 20 = pow(2, 19)
	$AnimatedSprite.animation = "death"
	alive = false

func _on_AnimatedSprite_animation_finished():
	if !alive:
		hide()