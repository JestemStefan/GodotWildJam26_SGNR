extends Spatial

class_name SpawnPoint

export (int) var percentage = 100
export (int) var capacity = 50
export (int) var wave_size = 5

export(Array,PackedScene) var enemies = []

onready var nav: Navigation = get_tree().get_nodes_in_group("navigation")[0]

var enemies_left: int

func _ready():
	enemies_left = capacity


func spawn_enemies():
	var en:PackedScene

	if enemies_left <= 0:
		return

	#print_debug("New wave coming ...")
	
	for items in range(wave_size):
		if enemies_left <= 0:
			#print_debug("No more enemies left")
			break

		enemies.shuffle()
		en = enemies[0]
		var enemy = en.instance(PackedScene.GEN_EDIT_STATE_INSTANCE)

		#Spawn enemy in a position of spawn point
		enemy.global_transform.origin = global_transform.origin

		nav.add_child(enemy)

		enemies_left -= 1
