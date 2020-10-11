extends Control

var health: int = 100;
var ammo: int = 4;

var status: Label;

func set_heath(value):
	health = value

func _ready():
	status = $Status/Label

func _process(delta):
	status.text = "Health: " + str(health) + "\n" + "Ammo: " + str(ammo) + " / " + "10";

