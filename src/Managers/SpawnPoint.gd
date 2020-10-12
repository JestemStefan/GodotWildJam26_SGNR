extends Spatial

class_name SpawnPoint

export (int) var percentage = 100

export(Array,PackedScene) var enemies = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _update(delta):
	pass

func spawn_enemies(num: int):
	var en:PackedScene
	
	for e in enemies:
		en = e
		var enemy = en.instance(PackedScene.GEN_EDIT_STATE_INSTANCE)
		add_child(enemy)
