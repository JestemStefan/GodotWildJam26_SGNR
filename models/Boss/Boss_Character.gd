extends KinematicBody

onready var nav: Navigation = get_tree().get_nodes_in_group("navigation")[0]

onready var anim_player:AnimationPlayer = $AnimationPlayer

export(int) var speed = 20

var path = []
var path_node = 0

var got_to_location:bool = false

func _ready():
	$AnimationPlayer.play("Run")
	get_new_path(get_parent().get_node("Close_Doors").global_transform.origin)

func _physics_process(delta):
	if !got_to_location:
		if path_node < path.size():
				var dir:Vector3 = (path[path_node] - global_transform.origin)
				if dir.length_squared() < 1:
					path_node += 1

				else:
					process_movement(dir)

func get_new_path(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)
	path_node = 0

func process_movement(direction):
	look_at(path[path_node], Vector3.UP)
	move_and_slide(direction.normalized() * speed, Vector3.UP)


func _on_Close_Doors_body_entered(body):
	if body == self:
		anim_player.play("Wave")


func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"Wave":
			$Timer.start(2)
	
		"Lift":
			anim_player.play("Idle")
	


func _on_Timer_timeout():
	$CollisionShape.disabled = true
	anim_player.play("Lift")
	anim_player.set_speed_scale(1)
	
	set_scale(Vector3(0.8, 0.8, 0.8))
	got_to_location = true
	
	global_transform.origin = get_parent().get_node("FoodProcessor/ChefRespawn").global_transform.origin
	
