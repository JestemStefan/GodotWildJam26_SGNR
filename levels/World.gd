extends Spatial

var globals

func _ready():
	globals = get_node("/root/Globals")
	
	globals.play_sound("ambient", true)


	$"SpawnPointManager/Muffins One".visible = globals.get_value("game/enemies/muffins/enabled")
	$"SpawnPointManager/Muffins Two".visible = globals.get_value("game/enemies/muffins/enabled")

	$"SpawnPointManager/Flyers".visible = globals.get_value("game/enemies/flyers/enabled")
