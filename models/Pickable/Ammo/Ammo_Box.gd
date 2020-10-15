extends PickUp

var ammo_gained:int = 6

func pick_up_effect():
	player.gain_ammo(ammo_gained)

