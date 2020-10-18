extends Control

var health: int = 100;
var ammo: int = 10;

onready var status_HP: TextureProgress = $Status/HP
onready var status_Ammo: TextureProgress = $Status/Ammo



func set_heath(hp_value):
	health = hp_value
	status_HP.set_value(health)
	
func set_ammo(ammo_value):
	ammo = ammo_value
	status_Ammo.set_value(ammo)


