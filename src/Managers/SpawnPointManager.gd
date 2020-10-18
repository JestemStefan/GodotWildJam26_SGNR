extends Spatial

onready var timer = $Timer

export var every_seconds: float = 5.0
export var number_of_waves: int = 2

var spawn_points: Array = []
var wave_index = 0

# We use percentages to random select SpawnPoint
# Say: a = 150% b = 75% c = 25%
# Sum = a + b + c = 250%
# RND(Sum) = 175%
# Select = b
var percentages: Array = []
var total_percentages:int = 0

var rng = RandomNumberGenerator.new()

func start_wave():
	if (wave_index < number_of_waves):
		for c in get_children():
			if c is SpawnPoint:
				var s:SpawnPoint = c
				s.start_wave(wave_index)
		wave_index += 1


func _ready():
	rng.randomize()

	timer.wait_time = every_seconds

	var spawn_points_number_of_waves = 0
	for c in get_children():
		if c is SpawnPoint:
			var s:SpawnPoint = c
			var num_waves = s.get_number_of_waves()
			if num_waves > 0:
				if spawn_points_number_of_waves == 0:
					spawn_points_number_of_waves = num_waves
				elif spawn_points_number_of_waves == num_waves:
					pass
				else:
					spawn_points_number_of_waves = -1
			if s.visible:
				spawn_points.push_back(s)
				percentages.push_back(s.percentage)
				total_percentages += s.percentage

	if spawn_points_number_of_waves == -1:
		print_debug("Imbalanced number of waves: check Spawn Manager and Points")
		get_tree().quit()

	start_wave()

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
