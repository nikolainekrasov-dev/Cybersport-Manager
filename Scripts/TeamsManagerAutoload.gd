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

static var teams_count = 320

var all_teams = []

var player_team: Team = null

func _ready():
	var file = FileAccess.open("res://Teams//Teams.json", FileAccess.READ)
	var content = file.get_as_text()
	var parsed = JSON.parse_string(content)
	var threads = []
	for region in parsed:
		var new_thread = Thread.new()
		new_thread.start(Callable(self, "create_teams_from_region").bind(region, parsed[region]))
		threads.append(new_thread)
	for thread in threads:
		thread.wait_to_finish()
	for region in teams_by_region:
		all_teams += teams_by_region[region]

func create_teams_from_region(region, teams_names):
	for team_name in teams_names:
		var team = Team.new(team_name, region)
		teams_by_region[region].append(team)

func setup_teams_for_new_game(new_player_team):
	make_all_teams_inactive()
	for region in teams_by_region:
		var rand_indices = []
		var player_team_index = teams_by_region[region].find(new_player_team)
		var random_indices = Utils.get_random_set(team_count_in_region, 0, 40)
		if player_team_index != -1 and not(random_indices.has(player_team_index)):
			random_indices[0] = player_team_index
		var active_team_index = 0
		for team_index in range(len(teams_by_region[region])):
			teams_by_region[region][team_index].nullify_team()
			if team_index in random_indices:
				teams_by_region[region][team_index].is_active = true
				teams_by_region[region][team_index].roster["Carry"] = weakref(PlayersManager.players_by_region_and_role[region]["Carry"][active_team_index])
				PlayersManager.players_by_region_and_role[region]["Carry"][active_team_index].team = weakref(teams_by_region[region][team_index])
				teams_by_region[region][team_index].roster["Assassin"] = weakref(PlayersManager.players_by_region_and_role[region]["Assassin"][active_team_index])
				PlayersManager.players_by_region_and_role[region]["Assassin"][active_team_index].team = weakref(teams_by_region[region][team_index])
				teams_by_region[region][team_index].roster["Tank"] = weakref(PlayersManager.players_by_region_and_role[region]["Tank"][active_team_index])
				PlayersManager.players_by_region_and_role[region]["Tank"][active_team_index].team = weakref(teams_by_region[region][team_index])
				teams_by_region[region][team_index].roster["Pusher"] = weakref(PlayersManager.players_by_region_and_role[region]["Pusher"][active_team_index])
				PlayersManager.players_by_region_and_role[region]["Pusher"][active_team_index].team = weakref(teams_by_region[region][team_index])
				teams_by_region[region][team_index].roster["Support"] = weakref(PlayersManager.players_by_region_and_role[region]["Support"][active_team_index])
				PlayersManager.players_by_region_and_role[region]["Support"][active_team_index].team = weakref(teams_by_region[region][team_index])
				active_team_index += 1
				
func make_all_teams_inactive():
	for team in all_teams:
		team.is_active = false
				
func set_player_team(new_player_team):
	self.player_team = new_player_team
	for event in on_player_team_changed:
		event.call(new_player_team)
