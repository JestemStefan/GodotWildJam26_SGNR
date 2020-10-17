extends KinematicBody
class_name PickUp

export var launch_direction: Vector3
const GRAVITY = -5

var move_dir: Vector3

var isPickedUp: bool = false

onready var player: KinematicBody = get_tree().get_nodes_in_group("player")[0]

var distance2Player: float

func _ready():
	$AnimationPlayer.play("Rotate")
	
	randomize()
	var random_vector = Vector3(rand_range(-1,1),rand_range(-0.5,0.5),rand_range(-1,1))
	move_dir = launch_direction + random_vector
	
	
func _physics_process(delta):
	distance2Player = global_transform.origin.distance_squared_to(player.global_transform.origin)
	
	if distance2Player > 150:
		move_dir.y += delta * GRAVITY
		
		if is_on_floor():
			move_dir = Vector3.ZERO
	
		
		
	else:
		move_dir = global_transform.origin.direction_to(player.global_transform.origin)
		
		if distance2Player < 10:
			pick_up_effect()
			call_deferred("free")
		
	move_and_slide(move_dir * 25, Vector3.UP, false)
		
func pick_up_effect():
	pass
		
		
		
	

