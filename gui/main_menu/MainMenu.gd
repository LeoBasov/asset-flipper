extends MarginContainer

var index : int = 0
var multiplicator : float = 1.0
var color : float = 0.0
var played : bool

func _ready():
	played = false
	color = 0.0

func _process(delta):
	color += delta*multiplicator
	
	if color >= 1.0 or color <= 0.0:
		multiplicator *= -1
	
	if Input.is_action_pressed("ui_up"):
		if index > 0:
			index -= 1
			$MenuSelect.play()
			played = false
		elif !$MenuSelect.playing and !$MenuSelectBlock.playing and !played:
			played = true
			$MenuSelectBlock.play()
	elif Input.is_action_pressed("ui_down"):
		if index < 1:
			index += 1
			$MenuSelect.play()
			played = false
		elif !$MenuSelect.playing and !$MenuSelectBlock.playing and !played:
			played = true
			$MenuSelectBlock.play()
	
	if Input.is_action_pressed("ui_accept") and index == 0:
		get_tree().change_scene("res://Main.tscn")
	elif Input.is_action_pressed("ui_accept") and index == 1:
		get_tree().quit()
		
	if index == 0:
		$VBoxContainer/NewGame.modulate = Color(color, 0, 0)
		$VBoxContainer/Quit.modulate = Color(1, 1, 1)
	elif index == 1:
		$VBoxContainer/NewGame.modulate = Color(1, 1, 1)
		$VBoxContainer/Quit.modulate = Color(color, 0, 0)
