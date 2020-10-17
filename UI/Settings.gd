extends CenterContainer

onready var globals = get_node("/root/Globals")

onready var ambient:CheckButton = $"HBoxContainer/VBoxContainer2/Ambient Sound"
onready var sound_fx:CheckButton = $"HBoxContainer/VBoxContainer2/Sound FX"

onready var has_muffins:CheckBox = $"HBoxContainer/VBoxContainer/Muffins/Has Muffins"
onready var num_muffins:HSlider = $"HBoxContainer/VBoxContainer/Muffins/Num Muffins"

onready var has_flyers:CheckBox = $"HBoxContainer/VBoxContainer/Flyers/Has Flyers"
onready var num_flyers:HSlider = $"HBoxContainer/VBoxContainer/Flyers/Num Flyers"

func _ready():
	ambient.pressed = globals.get_value("game/sound/ambient")
	sound_fx.pressed = globals.get_value("game/sound/soundfx")

	has_muffins.pressed = globals.get_value("game/enemies/muffins/enabled")
	has_flyers.pressed = globals.get_value("game/enemies/flyers/enabled")



func _on_Ambient_Sound_toggled(button_pressed):
	globals.set_value("game/sound/ambient", button_pressed)


func _on_Sound_FX_toggled(button_pressed):
	globals.set_value("game/sound/soundfx", button_pressed)


func _on_Has_Flyers_toggled(button_pressed):
	globals.set_value("game/enemies/flyers/enabled", button_pressed)


func _on_Num_Flyers_value_changed(value):
	globals.set_value("game/enemies/flyers/enabled", value)
