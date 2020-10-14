extends Spatial

class_name SpawnPoint

export (int) var percentage = 100

export(Array,PackedScene) var enemies = []

onready var nav: Navigation = get_tree().get_nodes_in_group("navigation")[0]

func spawn_enemies(num: int):
	var en:PackedScene
	
	for e in enemies:
		en = e
		var enemy = en.instance(PackedScene.GEN_EDIT_STATE_INSTANCE)

		nav.add_child(enemy)
