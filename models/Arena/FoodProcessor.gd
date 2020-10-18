extends Spatial

onready var blender = $FP_Blender
onready var small_blender = $FP_Small_Blender
onready var bowl = $FP_Bowl

onready var door_animplayer: AnimationPlayer = $Doors
onready var blast_area = preload("res://models/CollisionShapes/Blast_area.tscn")

onready var boss: KinematicBody = get_tree().get_nodes_in_group("boss")[0]

signal DoorClosing
signal DoorOpening

var closed: bool = false

func _ready():
	$Spinning.play("Idle")

func damage_part(name):
	
# This is crap and doesn't work :/
	var part = null
	match name:
		"FP_Blender":
			part = blender
		"FP_Small_Blender":
			part = small_blender
		"FP_Bowl":
			part = bowl
	
	if part != null:
		var explosion = blast_area.instance()
		get_tree().get_current_scene().add_child(explosion)
		explosion.global_transform.origin = part.global_transform.origin
	
		part.call_deferred("free")
	
func open_close():
	if closed:
		door_animplayer.play("OpenDoors")
		emit_signal("DoorOpening")
	else:
		door_animplayer.play("CloseDoors")
		emit_signal("DoorClosing")
	closed = !closed


func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"Wave":
			open_close()

