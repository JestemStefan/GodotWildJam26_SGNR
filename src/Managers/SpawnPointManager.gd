extends Spatial

onready var timer = $Timer

export var every_seconds: float = 5.0

var spawn_points: Array = []

# We use percentages to random select SpawnPoint
# Say: a = 150% b = 75% c = 25%
# Sum = a + b + c = 250%
# RND(Sum) = 175%
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
			if s.visible:
				spawn_points.push_back(s)
				percentages.push_back(s.percentage)
				total_percentages += s.percentage

func _on_Timer_timeout():
	# We select one SpawnPoint based on its percentage
	var coin:int = rng.randi_range(0, total_percentages)

	for i in range(spawn_points.size()):
		var s:SpawnPoint = spawn_points[i]

		if !s.visible || s.is_depleted():
			# Skip when depleted
			continue

		coin -= s.percentage
		if coin <= 0:
			s.spawn_enemies()
			if s.is_depleted():
				# When depleted remove from total_percentages
				total_percentages -= percentages[i]
			break
