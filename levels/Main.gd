extends Node2D


var globals


func _ready():
	globals = get_node("/root/Globals")

	globals.play_sound("ambient", true)


func _on_Start_pressed():
	globals.load_new_scene("levels/World.tscn")


func _on_Audio_pressed():
	globals.load_new_scene("UI/Audio.tscn")
