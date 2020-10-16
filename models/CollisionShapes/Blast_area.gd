extends Area

export var AoE_damage: int

var hasExploded:bool = false
onready var particle_smoke: Particles = $Smoke
onready var timer: Timer = $Timer

func _ready():
	particle_smoke.set_emitting(true)
	timer.start(1)
	
	
func _physics_process(delta):
	if !hasExploded:
		find_explosion_victims()
		

func find_explosion_victims():
	var victims = get_overlapping_bodies()
	
	if victims.size() > 0:
		hasExploded = true
		timer.start(1)
		for victim in victims:
			if victim.has_method("take_damage"):
				victim.take_damage(AoE_damage)


func _on_Timer_timeout():
	call_deferred("free")
