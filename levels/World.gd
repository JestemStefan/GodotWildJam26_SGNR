extends Spatial

var globals

onready var spawn_point_manager = $SpawnPointManager

func _ready():
	globals = get_node("/root/Globals")
	
	globals.play_sound("ambient", true)


	$"SpawnPointManager/Muffins One".visible = globals.get_value("game/enemies/muffins/enabled")
	$"SpawnPointManager/Muffins Two".visible = globals.get_value("game/enemies/muffins/enabled")

	$"SpawnPointManager/Flyers".visible = globals.get_value("game/enemies/flyers/enabled")

func _process(_delta):
	if spawn_point_manager.is_depleted():
		if get_tree().get_nodes_in_group("Enemy").size() == 0:
			spawn_point_manager.start_wave()
