extends Node

class_name TeamsManagerAutoload

var on_player_team_changed = []
static var team_count_in_region = 20

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

var player_team: Team = null

func _ready():
	var file = FileAccess.open("res://Teams//Teams.json", FileAccess.READ)
	var content = file.get_as_text()
	var parsed = JSON.parse_string(content)
	for region in parsed:
		for name in parsed[region]:
			var team = Team.new(name, region)
			teams_by_region[region].append(team)

func choose_teams_for_new_game(new_player_team):
	set_player_team(new_player_team)
	for region in teams_by_region:
		var rand_indices = []
		var player_team_index = teams_by_region[region].find(player_team)
		if player_team_index != -1:
			rand_indices.append(player_team_index)
		while len(rand_indices) < team_count_in_region:
			var index = randi() % 40
			if not(rand_indices.has(index)):
				rand_indices.append(index)
		for team_index in range(len(teams_by_region[region])):
			if team_index in rand_indices:
				teams_by_region[region][team_index].is_active = true
			else:
				teams_by_region[region][team_index].is_active = false
				
func set_player_team(new_player_team):
	self.player_team = new_player_team
	for event in on_player_team_changed:
		event.call(new_player_team)
