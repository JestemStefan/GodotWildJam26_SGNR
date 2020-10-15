extends RigidBody


export var speed:float = 1.2

# Called when the node enters the scene tree for the first time.
func _ready():
	set_linear_velocity(Vector3.FORWARD * speed)

