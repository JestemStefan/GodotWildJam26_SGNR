extends Spatial


var spawn_points:Array = []

var every_ticks = 5 * 60
var current_tick = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	# Find all children SpawnPoints
	# Calculate the sum of their percentages
	# 
	pass # Replace with function body.

func _process(delta):
	current_tick += 1
	if (current_tick > every_ticks):
		current_tick = 0
		spawn_enemies(1)
	

func spawn_enemies(num: int):
	for c in get_children():
		if c is SpawnPoint:
			c.spawn_enemies(num)

