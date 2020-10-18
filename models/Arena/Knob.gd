extends Spatial


func _physics_process(delta):
	rotate_z(3 * delta)

