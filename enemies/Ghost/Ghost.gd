extends KinematicBody2D

const GRAVITY = 1000.0
const WALK_SPEED = 200

var velocity = Vector2(0.0, 0.0)

var damage : bool
var live : float

func _ready():
	reset()
	
func reset():
	live = 10.0
	damage = false
	collision_layer = 2
	show()
	
	$FSM.pop_state()
	$FSM.push_state($FSM/IdleState)

func _process(delta):
	$FSM.update(self)
	
func hit(damage_pts):
	if !damage:
		live -= damage_pts
		damage = true

func _on_DieState_die():
	collision_layer = 524288
	hide()
