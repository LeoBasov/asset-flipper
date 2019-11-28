extends "res://ai/FiniteState.gd"

var animation_running : bool
var attack_object

func _ready():
	animation_running = false
	attack_object = null

func update(object):
	animation_running = true
	object.get_node("AnimatedSprite").animation = "air-attack-1"
	
	if attack_object:
		if object.get_node("AnimatedSprite").frame == 1:
			attack(attack_object, object)
			
	if object.velocity.y == 0.0:
		animation_running = false
		emit_signal("pop")
		emit_signal("push", "IdleState")
	
	object.get_node("AnimatedSprite").play()
	
func attack(enenmy_object, player_object):
	for enenmy in get_tree().get_nodes_in_group("Enemies"):
		if enenmy.name == enenmy_object.name:
			enenmy.position += 0.1*(enenmy.position - player_object.position)
			enenmy.hit()

func _on_AirAttack1Area_body_entered(body):
	attack_object = body

func _on_AirAttack1Area_body_exited(body):
	attack_object = null


func _on_AnimatedSprite_animation_finished():
	if animation_running:
		animation_running = false
		emit_signal("pop")
		emit_signal("push", "IdleState")