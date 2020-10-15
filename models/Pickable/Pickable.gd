extends KinematicBody

export var launch_direction: Vector3
const GRAVITY = -9.8

var move_dir: Vector3

var isPickedUp: bool = false

onready var player: KinematicBody = get_tree().get_nodes_in_group("player")[0]

var distance2Player: float

func _ready():
	$AnimationPlayer.play("Rotate")
	
	randomize()
	var random_vector = Vector3(rand_range(-1,1),0,rand_range(-1,1))
	move_dir = launch_direction + random_vector
	
	
func _physics_process(delta):
	distance2Player = global_transform.origin.distance_squared_to(player.global_transform.origin)
	
	if distance2Player > 25:
		move_dir.y += delta * GRAVITY
		
		if is_on_floor():
			move_dir = Vector3.ZERO

	else:
		move_dir = global_transform.origin.direction_to(player.global_transform.origin)
		
	move_and_slide(move_dir, Vector3.UP, false)

