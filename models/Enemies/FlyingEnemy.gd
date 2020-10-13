extends RigidBody

var speed = 10

export var max_flap:int = 10
var flap:int = 0

onready var player = get_node("/root/World/Player")

# Enemy is attracted to player
func _physics_process(delta):
	var me = global_transform.origin
	var him = player.global_transform.origin

	var dir = (him - me).normalized() * speed
	add_force(dir, Vector3.ZERO)
	if flap > 0:
		flap -= 1
		add_force(Vector3.UP * 25, Vector3.ZERO)


func _on_Flap_timeout():
	flap = max_flap
