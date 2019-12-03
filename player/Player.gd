extends KinematicBody2D

const GRAVITY = 1000.0
export var WALK_SPEED = 200
export var max_live : float = 10.0

var velocity = Vector2(0.0, 0.0)
export var live : float = 10.0
var damage : bool

func _ready():
	$FSM.push_state($FSM/IdleState)
	
func _physics_process(delta):
	$FSM.update(self)
	
	velocity.y += delta * GRAVITY
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
func hit(damage_pts):
	if !damage:
		live -= damage_pts
		$CanvasLayer/HUD/HBoxContainer/TextureProgress.value = 100.0*(live/max_live)
		damage = true
	
func reset():
	damage = false
	position = Vector2(0.0, 0.0)
	velocity = Vector2(0.0, 0.0)
	
	$AnimatedSprite.flip_h = false
	$CanvasLayer/HUD/HBoxContainer/TextureProgress.value = 100
	
	$FSM.pop_state()
	$FSM.push_state($FSM/IdleState)