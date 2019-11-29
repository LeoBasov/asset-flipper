extends KinematicBody2D

export var fly_speed = 200
export var max_live : float = 10

var live : float
var velocity = Vector2(0.0, 0.0)
var starting_position : Vector2

var damage : bool
var player

func _ready():
	starting_position = position
	reset()
	
func reset():
	player = null
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
	
	for node in $FSM/ShriekState.get_children():
		if node.is_in_group("Fireballs"):
			if !node.set:
				node.set = true
				node.velocity = 2*fly_speed*(player.position - node.position).normalized()
	
func _physics_process(delta):
	move_and_collide(velocity*delta)
	
func hit(damage_pts):
	if !damage:
		live -= damage_pts
		damage = true

func _on_DieState_die():
	hide()

func _on_AgroRadius_body_entered(body):
	player = get_tree().get_nodes_in_group("Player").front()