extends Spatial

onready var blender = $FP_Blender
onready var small_blender = $FP_Small_Blender
onready var bowl = $FP_Bowl

var blender_HP = 100
var S_blender_HP = 100
var bowl_HP = 100

onready var door_animplayer: AnimationPlayer = $Doors
onready var blast_area = preload("res://models/CollisionShapes/Blast_area.tscn")

onready var boss: KinematicBody = get_tree().get_nodes_in_group("boss")[0]
onready var Boss_HP: TextureProgress = get_tree().get_nodes_in_group("Boss_HP")[0]

signal DoorClosing
signal DoorOpening

var closed: bool = false

func _ready():
	$Spinning.play("Idle")
	Boss_HP.set_value(blender_HP + S_blender_HP + bowl_HP)

func damage_part(name):
	
# This is crap and doesn't work :/
	var part = null
	match name:
		"FP_Blender":
			part = blender
			blender_HP -= 10
			if blender_HP <= 0:
				part.call_deferred("free")
		"FP_Small_Blender":
			part = small_blender
			S_blender_HP -= 10
			if S_blender_HP <= 0:
				part.call_deferred("free")
		"FP_Bowl":
			part = bowl
			bowl_HP -= 10
			if bowl_HP <= 0:
				part.call_deferred("free")
	
	if part != null:
		var explosion = blast_area.instance()
		get_tree().get_current_scene().add_child(explosion)
		explosion.global_transform.origin = part.global_transform.origin
		
		Boss_HP.set_value(blender_HP + S_blender_HP + bowl_HP)
	
		
	
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

