extends Spatial

var globals

var canSpawn : bool = false
onready var spawn_point_manager = $SpawnPointManager
onready var FP_anim = $FoodProcessor/Doors
onready var waveTimer: Timer = $WaveTimer

func _ready():
	globals = get_node("/root/Globals")
	
	globals.play_sound("ambient", true)


	$"SpawnPointManager/Muffins One".visible = globals.get_value("game/enemies/muffins/enabled")
	#$"SpawnPointManager/Muffins Two".visible = globals.get_value("game/enemies/muffins/enabled")

	#$"SpawnPointManager/Flyers".visible = globals.get_value("game/enemies/flyers/enabled")

func check_for_spawn():
	if spawn_point_manager.is_depleted():
		if get_tree().get_nodes_in_group("Enemy").size() == 0:
			if canSpawn:
				canSpawn = false
				$FoodProcessor.open_close()
				spawn_point_manager.start_wave()


func _on_WaveTimer_timeout():
	print("Timeout")
	canSpawn = true
	check_for_spawn()


