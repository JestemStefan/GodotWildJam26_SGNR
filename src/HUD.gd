extends Control

var health: int = 100;
var ammo: int = 4;

var status: Label;

func set_heath(hp_value):
	health = hp_value
	
func set_ammo(ammo_value):
	ammo = ammo_value

func _ready():
	status = $Status/Label

func _process(_delta):
	status.text = "Health: " + str(health) + "\n" + "Ammo: " + str(ammo) + " / " + "10";

