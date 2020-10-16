extends PickUp

var hp_healed:int = 25

func pick_up_effect():
	player.heal(hp_healed)
