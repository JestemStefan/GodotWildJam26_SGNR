extends Node2D


onready var globals = get_node("/root/Globals")


func _ready():
	globals.play_sound("ambient", true)


func _on_Start_pressed():
	globals.load_new_scene("levels/World.tscn")


func _on_Audio_pressed():
	globals.load_new_scene("UI/Audio.tscn")


func _on_Settings_pressed():
	globals.load_new_scene("UI/Settings.tscn")


func _on_Arena_pressed():
	globals.load_new_scene("levels/Arena_Level.tscn")


func _on_Credits_pressed():
	globals.load_new_scene("UI/Credits.tscn")
