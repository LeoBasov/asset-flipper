extends MarginContainer

var index : int = 0
var multiplicator : float = 1.0
var color : float = 0.0

func _ready():
	color = 0.0
	$ColorRect.modulate  = Color(1, 1, 1, 0.5)
	hide()
	set_process(false)
	
func activate():
	get_tree().paused = true
	show()
	set_process(true)
	
func deactivate():
	get_tree().paused = false
	hide()
	set_process(false)
	
func _process(delta):
	color += delta*multiplicator
	
	if color >= 1.0 or color <= 0.0:
		multiplicator *= -1
		
	if Input.is_action_pressed("ui_up"):
		if index > 0:
			index -= 1
			$MenuSelect.play()
		elif !$MenuSelect.playing and !$MenuSelectBlock.playing and $MenuBlockSoundTimer.is_stopped():
			$MenuSelectBlock.play()
			$MenuBlockSoundTimer.start()
	elif Input.is_action_pressed("ui_down"):
		if index < 1:
			index += 1
			$MenuSelect.play()
		elif !$MenuSelect.playing and !$MenuSelectBlock.playing and $MenuBlockSoundTimer.is_stopped():
			$MenuSelectBlock.play()
			$MenuBlockSoundTimer.start()
			
	if Input.is_action_pressed("ui_accept") and index == 0:
		deactivate()
	elif Input.is_action_pressed("ui_accept") and index == 1:
		get_tree().quit()
		
	if index == 0:
		$HBoxContainer/VBoxContainer/ContinueLabel.modulate = Color(color, 0, 0)
		$HBoxContainer/VBoxContainer/QuitLabel.modulate = Color(1, 1, 1)
		
	elif index == 1:
		$HBoxContainer/VBoxContainer/ContinueLabel.modulate = Color(1, 1, 1)
		$HBoxContainer/VBoxContainer/QuitLabel.modulate = Color(color, 0, 0)