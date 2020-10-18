extends RigidBody

var speed = 10
var health = 100

export var max_flap:int = 10
var flap:int = 0

onready var globals = get_node("/root/Globals")

onready var player = get_tree().get_nodes_in_group("player")[0]
onready var audio_player_3d = $AudioPlayer3D

var towards: bool = true

func _ready():
	globals.play_sound('alien', false, audio_player_3d)


func _physics_process(delta):
	var me:Vector3 = global_transform.origin
	var him:Vector3 = player.global_transform.origin

	var direction:Vector3 = him - me
	var distance = direction.length()

	if distance > 10:
		towards = true

	if distance < 3:
		player.take_damage(1)
		towards = false

	var dir = direction.normalized() * speed

	if !towards:
		dir = -dir

	add_force(dir, Vector3.ZERO)

	if flap > 0:
		flap -= 1
		add_force(Vector3.UP * 25, Vector3.ZERO)


func _on_Flap_timeout():
	flap = max_flap

# NOTE: copied from Enemy_class.gd
func take_damage(damage_amount):
	health -= damage_amount

	if health > 0:
		print(health)
	else:
		queue_free()
