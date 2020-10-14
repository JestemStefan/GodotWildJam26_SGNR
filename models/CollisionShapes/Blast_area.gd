extends Area

export var AoE_damage: int

var hasExploded:bool = false

func _ready():
	$Smoke.set_emitting(true)
	
	
func _physics_process(delta):
	if hasExploded:
		if !$Smoke.emitting:
			call_deferred("free")
	else:
		find_explosion_victims()
		

func find_explosion_victims():
	var victims = get_overlapping_bodies()
	
	if victims.size() > 0:
		hasExploded = true
		for victim in victims:
			if victim.has_method("take_damage"):
				victim.take_damage(AoE_damage)
