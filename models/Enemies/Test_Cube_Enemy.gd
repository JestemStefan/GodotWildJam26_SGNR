extends KinematicBody

var path = []
var path_node = 0

var speed = 10

onready var nav: Navigation = get_tree().get_nodes_in_group("navigation")[0]
onready var player:KinematicBody = get_tree().get_nodes_in_group("player")[0]

func _ready():
	pass
	
func _physics_process(delta):
	if path_node < path.size():
		var dir:Vector3 = (path[path_node] - global_transform.origin)
		if dir.length_squared() < 1:
			path_node += 1
		else:
			move_and_slide(dir.normalized() * speed, Vector3.UP)
			
func move_to(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)
	path_node = 0

func _on_Timer_timeout():
	move_to(player.global_transform.origin)
