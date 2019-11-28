extends Node

func _ready():
	reset()
	$BackgroundMusic.play()
	
func _process(delta):
	if Input.is_action_pressed("ui_reset"):
		reset()
	
func reset():
	$Player.reset()
	$Player.position = Vector2(490, 340)
	
	for enemy in get_tree().get_nodes_in_group("Enemies"):
		enemy.reset()

func _on_PlayerVisNotifier2D_screen_exited():
	reset()
