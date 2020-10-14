extends KinematicBody
class_name EnemyClass

export(int) var health = 100
export(int) var speed = 10

var path = []
var path_node = 0
var player_position: Vector3
var dist2player: float

onready var nav: Navigation = get_tree().get_nodes_in_group("navigation")[0]
onready var player: KinematicBody = get_tree().get_nodes_in_group("player")[0]
onready var anim_player: AnimationPlayer = $AnimationPlayer

func _ready():
	pass
	
func _physics_process(delta):
	player_position = player.global_transform.origin
	dist2player = global_transform.origin.distance_squared_to(player_position)

	if path_node < path.size():
		var dir:Vector3 = (path[path_node] - global_transform.origin)
		if dir.length_squared() < 1:
			path_node += 1

		else:
			process_movement(dir)
			
			
func process_movement(direction):
	pass

func get_new_path(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)
	path_node = 0

func _on_Timer_timeout():
	get_new_path(player_position)

func take_damage(damage_amount):
	health -= damage_amount
	
	if health > 0:
		print(health)
	else:
		queue_free()

func play_animation(name:String, anim_speed:float):
	anim_player.play(name)
	anim_player.set_speed_scale(anim_speed)
	

