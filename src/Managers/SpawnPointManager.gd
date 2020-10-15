extends Spatial

onready var timer = $Timer

export var every_seconds: float = 5.0

var spawn_points: Array = []

# We use percentages to random select
# a SpawnPoint to spawn
# Say: a:150% b:75% c:25%
# Sum = a+b+c = 250%
# Coin = 175%
# Select = b
var percentages: Array = []
var total_percentages:int = 0

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()

	timer.wait_time = every_seconds
	for c in get_children():
		if c is SpawnPoint:
			var s:SpawnPoint = c
			spawn_points.push_back(s)
			percentages.push_back(s.percentage)
			total_percentages += s.percentage

func _on_Timer_timeout():
	# Select 1 SpawnPoint
	var coin:int = rng.randi_range(0, total_percentages)

	for i in range(spawn_points.size()):
		var s:SpawnPoint = spawn_points[i]
		coin -= s.percentage
		if coin <= 0:
			print_debug("Index: ", i)#, " Coin: ", coin, " Percentage: ", s.percentage)
			s.spawn_enemies()
			break
