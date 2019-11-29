extends "res://ai/FiniteState.gd"

var animation_running : bool
var sound_played : bool
var attack_object
export var damage : float = 10.0

	
func reset():
	animation_running = false
	attack_object = null
	sound_played = false

func update(object):
	animation_running = true
	object.get_node("AnimatedSprite").animation = "air-attack-1"
	
	if !sound_played and object.get_node("AnimatedSprite").frame == 1:
		sound_played =  true
		$AirAttack1Sound.play()
	
	if attack_object:
		if object.get_node("AnimatedSprite").frame == 1:
			attack(attack_object, object)
			
	if object.velocity.y == 0.0:
		animation_running = false
		sound_played = false
		emit_signal("pop")
		emit_signal("push", "IdleState")
	
	object.get_node("AnimatedSprite").play()
	
func attack(enenmy_object, player_object):
	for enenmy in get_tree().get_nodes_in_group("Enemies"):
		if enenmy.name == enenmy_object.name:
			enenmy.position += 0.1*(enenmy.position - player_object.position)
			enenmy.hit(damage)

func _on_AirAttack1Area_body_entered(body):
	attack_object = body

func _on_AirAttack1Area_body_exited(body):
	attack_object = null


func _on_AnimatedSprite_animation_finished():
	if animation_running:
		animation_running = false
		sound_played = false
		emit_signal("pop")
		emit_signal("push", "IdleState")
