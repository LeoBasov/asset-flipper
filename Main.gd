extends Node

func _ready():
	reset()
	
func reset():
	$Player.reset()
	$Player.position = Vector2(490, 340)

func _on_PlayerVisNotifier2D_screen_exited():
	reset()
