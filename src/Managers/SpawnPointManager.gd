extends Spatial


export var every_ticks: int = 5 * 60

var current_tick = 0


func _process(delta):
	current_tick += 1
	if (current_tick > every_ticks):
		current_tick = 0
		spawn_enemies(1)
	

func spawn_enemies(num: int):
	for c in get_children():
		if c is SpawnPoint:
			c.spawn_enemies(num)
