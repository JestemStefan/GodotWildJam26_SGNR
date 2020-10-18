extends Spatial

class_name SpawnPoint

export (int) var percentage = 100

export (Array,int) var capacity = [50]
export (Array, int) var wave_size = [5]

export(Array,PackedScene) var enemies = []


onready var nav: Navigation = get_tree().get_nodes_in_group("navigation")[0]


var enemies_left: int
var wave_index = 0


func get_number_of_waves() -> int:
	var result = -1
	if capacity.size() == wave_size.size():
		result = capacity.size()
	return result


func get_capacity() -> int:
	return capacity[wave_index]


func get_wave_size() -> int:
	return wave_size[wave_index]


func start_wave(n: int):
	wave_index = n
	enemies_left = get_capacity()


func _ready():
	start_wave(0)


func is_depleted() -> bool:
	return enemies_left <= 0


func spawn_enemies():
	var en:PackedScene

	if is_depleted():
		return

	#print_debug("New wave coming ...")
	
	for _i in range(get_wave_size()):
		if enemies_left <= 0:
			#print_debug("No more enemies left")
			break

		enemies.shuffle()
		en = enemies[0]
		var enemy = en.instance(PackedScene.GEN_EDIT_STATE_INSTANCE)
		
		nav.add_child(enemy)
		
		#Spawn enemy in a position of spawn point
		enemy.global_transform.origin = get_global_transform().origin + Vector3(rand_range(0, 1), 0, rand_range(0,1))

		

		enemies_left -= 1
