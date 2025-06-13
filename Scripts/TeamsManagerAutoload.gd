extends Node

class_name TeamsManagerAutoload

var teams_by_region = {
	"Europe": [],
	"North America": [],
	"South America": [],
	"East Asia": [],
	"Southeast Asia": [],
	"CIS": [],
	"Africa and Middle East": [],
	"Oceania": []
}

func _ready():
	var file = FileAccess.open("res://Teams//Teams.json", FileAccess.READ)
	var content = file.get_as_text()
	var parsed = JSON.parse_string(content)
	for region in parsed:
		for name in parsed[region]:
			var team = Team.new(name, region)
			teams_by_region[region].append(team)
