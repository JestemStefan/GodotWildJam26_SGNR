extends PickUp

var ammo_gained:int = 6

func pick_up_effect():
	Globals.play_sound("ammunition_pickup")
	player.gain_ammo(ammo_gained)

