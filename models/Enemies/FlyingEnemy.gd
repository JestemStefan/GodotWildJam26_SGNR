extends RigidBody

var speed = 10
var health = 100

export var max_flap:int = 10
var flap:int = 0


onready var player = get_tree().get_nodes_in_group("player")[0]

func _physics_process(delta):
	# Enemy is attracted to player
	var me = global_transform.origin
	var him = player.global_transform.origin

	var dir = (him - me).normalized() * speed
	add_force(dir, Vector3.ZERO)

	if flap > 0:
		flap -= 1
		add_force(Vector3.UP * 25, Vector3.ZERO)


func _on_Flap_timeout():
	flap = max_flap

# NOTE: copied from Enemy_class.gd
func take_damage(damage_amount):
	health -= damage_amount

	print_debug(health)

	if health > 0:
		print(health)
	else:
		queue_free()
