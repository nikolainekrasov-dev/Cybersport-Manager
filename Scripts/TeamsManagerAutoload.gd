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

func choose_teams_for_new_game():
	for region in teams_by_region:
		var rand_indices = []
		while len(rand_indices) < 16:
			var index = randi() % 40
			if not(rand_indices.has(index)):
				rand_indices.append(index)
		for team_index in range(len(teams_by_region[region])):
			if team_index in rand_indices:
				teams_by_region[region][team_index].is_active = true
			else:
				teams_by_region[region][team_index].is_active = false
