extends WindowDialog

signal resume
signal main
signal quit

onready var button_resume = $CenterContainer/VBoxContainer/Resume

func _on_Resume_pressed():
	emit_signal("resume")


func _on_Quit_pressed():
	emit_signal("quit")


func _on_Main_pressed():
	emit_signal("main")
