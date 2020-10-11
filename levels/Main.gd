extends Node2D


var globals


func _ready():
	globals = get_node("/root/Globals")


func _on_Start_pressed():
	globals.load_new_scene("levels/World.tscn")
