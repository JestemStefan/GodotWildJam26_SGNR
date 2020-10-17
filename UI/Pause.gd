extends WindowDialog

signal resume
signal quit

onready var button_resume = $CenterContainer/VBoxContainer/Resume

func _on_Resume_pressed():
	emit_signal("resume")


func _on_Quit_pressed():
	emit_signal("quit")
