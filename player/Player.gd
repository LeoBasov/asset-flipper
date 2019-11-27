extends KinematicBody2D

const GRAVITY = 1000.0
const WALK_SPEED = 200

var velocity = Vector2(0.0, 0.0)

func _ready():
	pass
	
func _process(delta):

	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_accept"):
		$AnimatedSprite.animation = "attack-2"
	else:
		$AnimatedSprite.animation = "idle"
		
	$AnimatedSprite.play()
	
func _physics_process(delta):
	velocity.y += delta * GRAVITY

	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
	else:
		velocity.x = 0

    # We don't need to multiply velocity by delta because "move_and_slide" already takes delta time into account.

    # The second parameter of "move_and_slide" is the normal pointing up.
    # In the case of a 2D platformer, in Godot, upward is negative y, which translates to -1 as a normal.
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	if Input.is_action_pressed("ui_up") and abs(velocity.y) < 1.0:
		velocity.y = -500
	