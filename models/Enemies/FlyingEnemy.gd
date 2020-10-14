extends RigidBody

var speed = 10
var health = 100


onready var player = get_tree().get_nodes_in_group("player")[0]

func _physics_process(delta):
	# Enemy is attracted to player
	var me = global_transform.origin
	var him = player.global_transform.origin

	var dir = (him - me).normalized() * speed
	add_force(dir, Vector3.ZERO)

# NOTE: copied from Enemy_class.gd
func take_damage(damage_amount):
	health -= damage_amount

	print_debug(health)

	if health > 0:
		print(health)
	else:
		queue_free()
