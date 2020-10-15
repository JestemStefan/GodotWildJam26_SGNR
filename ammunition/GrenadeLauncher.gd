extends MeshInstance


onready var grenade = preload("res://ammunition/Grenade.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func shoot():
	var g = grenade.instance()
	g.set_rotation_degrees(Vector3(80,0,0))
	g.set_linear_velocity(Vector3.FORWARD * 40)
	get_parent().add_child(g)

func _on_Timer_timeout():
	shoot()
