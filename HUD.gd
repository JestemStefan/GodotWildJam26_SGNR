extends Control

var health: int = 100;
var ammo: int = 4;

var status: Label;

func set_heath(health):
	self.health = health

func _ready():
	status = $Status/Label

func _process(delta):
	status.text = "Health: " + str(health) + "\n" + "Ammo: " + str(ammo) + " / " + "10";

