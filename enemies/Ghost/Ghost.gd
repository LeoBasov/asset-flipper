extends KinematicBody2D

var alive : bool

func _ready():
	reset()
	
func reset():
	alive = true
	$AnimatedSprite.animation = "idle"
	collision_layer = 1
	collision_mask = 1
	show()

func _process(delta):
	$AnimatedSprite.play()
	
func _physics_process(delta):
	move_and_slide(Vector2(0, 0), Vector2(0, -1))
	
	for i in get_slide_count():
		collision_layer = 2
		collision_mask = 2
		$AnimatedSprite.animation = "death"
		alive = false

func _on_AnimatedSprite_animation_finished():
	if !alive:
		hide()