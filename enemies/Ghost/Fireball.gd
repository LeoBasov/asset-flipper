extends KinematicBody2D

var velocity : Vector2
var set : bool

func _ready():
	$AnimatedSprite.play()
	velocity = Vector2(0, 0)
	set = false

func _on_Timer_timeout():
	queue_free()

func _physics_process(delta):
	var collision = move_and_collide(velocity*delta)
	
	if collision and collision.collider.is_in_group("Player"):
		collision.collider.hit(0.0)
		queue_free()