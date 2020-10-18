extends Spatial

onready var spawn_point_manager = $SpawnPointManager
onready var door_timer = $DoorTimer
onready var food_processor = $FoodProcessor

var open_door: bool = false

#func _process(_delta):
#	if spawn_point_manager.is_depleted():
#		if get_tree().get_nodes_in_group("Enemy").size() == 0:
#			open_door = true
#			door_timer.start(5)

func start_wave():
	food_processor.open_close()
	spawn_point_manager.visible = true
	spawn_point_manager.start_wave()

func pause_wave():
	food_processor.open_close()
	spawn_point_manager.visible = true


func _on_FoodProcessor_DoorClosing():
	open_door = true
	door_timer.start(5)


func _on_FoodProcessor_DoorOpening():
	open_door = false
	door_timer.start(5)


func _on_DoorTimer_timeout():
	if food_processor != null:
		if open_door:
			start_wave()
		else:
			pause_wave()


func _on_Gameover_timeout():
	Globals.load_new_scene("UI/Credits.tscn")
