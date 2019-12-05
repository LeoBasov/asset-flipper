extends Node

func _ready():
	reset()
	$BackgroundMusic.play()
	
func _process(delta):
	if Input.is_action_pressed("ui_reset"):
		reset()
	elif Input.is_action_pressed("ui_pause"):
		$CanvasLayer/Pause.activate()
	
func reset():
	$Player.reset()
	$Player.position = Vector2(495, 300)
	
	for enemy in get_tree().get_nodes_in_group("Enemies"):
		enemy.reset()
		
	for state in get_tree().get_nodes_in_group("States"):
		state.reset()

func _on_PlayerVisNotifier2D_screen_exited():
	get_tree().change_scene("res://gui/game_over/GameOver.tscn")

func _on_Player_dead():
	get_tree().change_scene("res://gui/game_over/GameOver.tscn")
