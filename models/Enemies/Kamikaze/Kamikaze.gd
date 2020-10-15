extends "res://models/Enemies/Enemy_class.gd"

onready var blast_area = preload("res://models/CollisionShapes/Blast_area.tscn")
onready var ammo_box = preload("res://models/Pickable/Ammo/Ammo_Box.tscn")
onready var ammo_jar = preload("res://models/Pickable/Ammo/Ammo_Jar.tscn")

var isExploding : bool = false


func process_movement(direction):
	if dist2player > 25 and !isExploding:
		look_at(path[path_node], Vector3.UP)
		move_and_slide(direction.normalized() * speed, Vector3.UP)
		play_animation("Run", 2)
	else:
		isExploding = true
		play_animation("Explode", 2)

# Specific for each enemy. In case of Kamikaze it spawn a blast area
# and enemy is removed
func got_killed():
	explode()
	call_deferred("free")

func explode():
	var explosion = blast_area.instance()
	explosion.global_transform.origin = global_transform.origin
	get_tree().get_current_scene().add_child(explosion)
			
			
func spawn_reward():
	var reward = ammo_box.instance()
	reward.global_transform.origin = global_transform.origin
	get_tree().get_current_scene().add_child(reward)
	
	var reward2 = ammo_jar.instance()
	reward2.global_transform.origin = global_transform.origin
	get_tree().get_current_scene().add_child(reward2)

func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"Explode":
			got_killed()
			


