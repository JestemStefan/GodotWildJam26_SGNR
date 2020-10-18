extends VBoxContainer


onready var globals = get_node("/root/Globals")

onready var user_name:Label = $Columns/Name
onready var skills = $Columns/Skills
onready var links = $Columns/Links

func set_person(name, person):
	user_name.text = name
	print_debug(person)
	var credits = person["credits"]
	for c in credits:
		var l:Label = Label.new()
		skills.add_child(l)
		l.text = c

	var ls = person["links"]
	for l in ls:
		var lb:LinkButton = LinkButton.new()
		links.add_child(lb)
		lb.text = l
