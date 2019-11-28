extends Node

class_name FiniteState

signal pop()
signal push(state)

func _ready():
	add_to_group("States")
	reset()
	
func reset():
	pass

func update(object):
	pass