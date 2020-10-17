extends Control

signal play

func setValues(clip, resource):
	$Button.text = clip
	$Label.text = resource


func _on_Button_pressed():
	emit_signal("play")
