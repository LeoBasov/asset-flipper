extends KinematicBody2D

export var fly_speed = 200
export var max_live : float = 10

var live : float
var velocity = Vector2(0.0, 0.0)
var starting_position : Vector2

var damage : bool

func _ready():
	starting_position = position
	reset()
	
func reset():
	live = max_live
	damage = false
	collision_layer = 2
	position = starting_position
	velocity = Vector2(0.0, 0.0)
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
	hide()
