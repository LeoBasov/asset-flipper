extends Node

func _ready():
	reset()
	$BackgroundMusic.play()
	
func _process(delta):
	if Input.is_action_pressed("ui_reset"):
		reset()
	elif Input.is_action_pressed("ui_pause") and $PauseTimer.is_stopped():
		$CanvasLayer/ColorRect.modulate  = Color(1, 1, 1, 0.5)
		get_tree().paused = !(get_tree().paused)
		
		if get_tree().paused:
			$CanvasLayer/ColorRect.modulate  = Color(1, 1, 1, 0.5)
			$CanvasLayer/Label.show()
			$PauseTimer.start()
		else:
			$CanvasLayer/ColorRect.modulate  = Color(1, 1, 1, 0.0)
			$CanvasLayer/Label.hide()
			$PauseTimer.start()
	
func reset():
	$Player.reset()
	$Player.position = Vector2(495, 300)
	
	for enemy in get_tree().get_nodes_in_group("Enemies"):
		enemy.reset()
		
	for state in get_tree().get_nodes_in_group("States"):
		state.reset()

func _on_PlayerVisNotifier2D_screen_exited():
	reset()
