extends "res://ai/FiniteState.gd"

var sound_played : bool
var animation_running : bool
var attack_object_back
var attack_object_front
export var damage : float = 5.0
	
func reset():
	animation_running  = false
	attack_object_back = null
	attack_object_front = null
	sound_played = false

func update(object):
	animation_running = true
	object.get_node("AnimatedSprite").animation = "attack-2"
	object.get_node("AnimatedSprite").play()
	
	if !sound_played:
		sound_played =  true
		$Attack2Sound.play()
		
	if object.damage:
		emit_signal("pop")
		emit_signal("push", "HitState")
	
	if attack_object_front:
		if object.get_node("AnimatedSprite").frame == 3:
			attack(attack_object_front, object)
	elif attack_object_back:
		if object.get_node("AnimatedSprite").frame == 3:
			attack(attack_object_back, object)

func _on_AnimatedSprite_animation_finished():
	if animation_running:
		animation_running = false
		sound_played = false
		emit_signal("pop")
		emit_signal("push", "IdleState")
		
func attack(enemy_object, player_object):
	for enenmy in get_tree().get_nodes_in_group("Enemies"):
		if enenmy.name == enemy_object.name:
			enenmy.position += 0.1*(enenmy.position - player_object.position)
			enenmy.hit(damage)

func _on_Attack2AreaFront_body_entered(body):
 	attack_object_front = body


func _on_Attack2AreaFront_body_exited(body):
	attack_object_front = null

func _on_Attack2AreaBack_body_entered(body):
	attack_object_back = body


func _on_Attack2AreaBack_body_exited(body):
	attack_object_back = null
