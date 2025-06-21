extends AnimatedMenu

class_name TeamSelectionMenu

@export var teams_container: ScrollContainer
var scroll = find_child("Teams")
var team_buttons = []

func _ready():
	for team_button in teams_container.get_child(0).get_children():
		team_buttons.append(team_button)
		team_button.connect("pressed", Callable(self, "close_menu"))
		
func show_teams_from_region(region):
	var index = 0
	for team in TeamsManager.teams_by_region[region]:
		team_buttons[index].set_team(team)
		index += 1
	open_menu()
		
func close_menu():
	teams_container.scroll_vertical = 0
	super.close_menu()	

func show_european_teams():
	show_teams_from_region("Europe")
	
func show_north_american_teams():
	show_teams_from_region("North America")
	
func show_south_american_teams():
	show_teams_from_region("South America")

func show_east_asian_teams():
	show_teams_from_region("East Asia")
	
func show_southeast_asian_teams():
	show_teams_from_region("Southeast Asia")
	
func show_cis_teams():
	show_teams_from_region("CIS")
	
func show_african_teams():
	show_teams_from_region("Africa and Middle East")
	
func show_oceanian_teams():
	show_teams_from_region("Oceania")
