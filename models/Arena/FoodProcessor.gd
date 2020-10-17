extends Spatial

onready var blender = $FP_Blender
onready var small_blender = $FP_Small_Blender
onready var bowl = $FP_Bowl

onready var door_animplayer: AnimationPlayer = $Doors
onready var blast_area = preload("res://models/CollisionShapes/Blast_area.tscn")

var closed: bool = true

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
	

func _on_Timer_timeout():
	if closed:
		door_animplayer.play("OpenDoors")
	else:
		door_animplayer.play("CloseDoors")
	closed = !closed
