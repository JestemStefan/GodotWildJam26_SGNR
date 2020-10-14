extends Spatial

onready var ray_cast: RayCast = get_tree().get_nodes_in_group("player")[0].ray_cast

onready var b_decal = preload("res://BulletDecal.tscn")

func _process(delta):
	if Input.is_action_just_pressed("ui_fire"):
		print_debug("FIRED")
		var b = b_decal.instance()
		ray_cast.get_collider().add_child(b)
		b.global_transform.origin = ray_cast.get_collision_point()
