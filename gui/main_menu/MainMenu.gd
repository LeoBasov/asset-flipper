extends MarginContainer

var index = 0

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://Main.tscn")