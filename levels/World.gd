extends Spatial

var globals

func _ready():
	globals = get_node("/root/Globals")
	
	globals.play_sound("ambient", true)


