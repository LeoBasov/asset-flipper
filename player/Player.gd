extends KinematicBody2D

const GRAVITY = 1000.0
const WALK_SPEED = 200

var velocity = Vector2(0.0, 0.0)

func _ready():
	$FSM.push_state($FSM/IdleState)
	
func _physics_process(delta):
	$FSM.update(self)
	
	velocity.y += delta * GRAVITY
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
func reset():
	position = Vector2(0.0, 0.0)
	velocity = Vector2(0.0, 0.0)
	
	$AnimatedSprite.flip_h = false
	
	$FSM.pop_state()
	$FSM.push_state($FSM/IdleState)