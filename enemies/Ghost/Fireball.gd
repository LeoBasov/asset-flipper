extends KinematicBody2D

var velocity : Vector2
var set : bool

func _ready():
	velocity = Vector2(0, 0)
	set = false

func _on_Timer_timeout():
	queue_free()

func _physics_process(delta):
	move_and_collide(velocity*delta)