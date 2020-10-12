extends RigidBody

var speed = 10

onready var player = get_node("/root/World/Player")

# Enemy is attracted to player
func _physics_process(delta):
	var me = global_transform.origin
	var him = player.global_transform.origin

	var dir = (him - me).normalized() * speed
	add_force(dir, Vector3.ZERO)
