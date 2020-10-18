extends Spatial

onready var player: KinematicBody = get_tree().get_nodes_in_group("player")[0]
onready var entrace_anim: AnimationPlayer = $AnimationPlayer

func _on_EntraceTrigger_body_entered(body):
	if body == player:
		entrace_anim.play("Close")


func _on_AnimationPlayer_animation_finished(anim_name):
	get_parent().get_node("EntraceTrigger").call_deferred("free")
