extends KinematicBody2D

export var fly_speed = 200
export var max_live : float = 10

var player
var velocity = Vector2(0.0, 0.0)
var damage : bool
var live : float

func _ready():
	reset()
	
func reset():
	player = null
	velocity = Vector2(0.0, 0.0)
	damage = false
	live = max_live
	
	$FSM.pop_state()
	$FSM.push_state($FSM/IdleState)

func _process(delta):
	$FSM.update(self)