extends KinematicBody2D

var player

func _ready():
	reset()
	
func reset():
	player = null
	
	$FSM.pop_state()
	$FSM.push_state($FSM/IdleState)

func _process(delta):
	$FSM.update(self)