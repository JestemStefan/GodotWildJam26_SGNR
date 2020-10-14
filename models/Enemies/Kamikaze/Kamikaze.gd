extends "res://models/Enemies/Enemy_class.gd"

var isExploding : bool = false

func process_movement(direction):
	if dist2player > 25 and !isExploding:
		look_at(path[path_node], Vector3.UP)
		move_and_slide(direction.normalized() * speed, Vector3.UP)
		play_animation("Run", 2)
	else:
		isExploding = true
		play_animation("Explode", 2)


func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"Explode":
			call_deferred("free")
