extends Node

func _ready():
	reset()
	
func _process(delta):
	if Input.is_action_pressed("ui_reset"):
		reset()
	
func reset():
	$Player.reset()
	$Player.position = Vector2(490, 340)
	
	$Ghost.reset()

func _on_PlayerVisNotifier2D_screen_exited():
	reset()
