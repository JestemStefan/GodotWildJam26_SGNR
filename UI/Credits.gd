extends VBoxContainer


onready var globals = get_node("/root/Globals")

onready var people = $People
const PERSON = preload("res://UI/Person.tscn")

var credits

func _ready():
	globals.play_sound("cookie_crumbles")

	credits = globals.get_value('credits')
	var ps = credits["names"]
	for p in ps:
		var person = PERSON.instance()
		people.add_child(person)
		person.set_person(p, ps[p])
