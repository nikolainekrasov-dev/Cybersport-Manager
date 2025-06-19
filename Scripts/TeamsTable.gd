extends ScrollContainer

class_name TeamsTable

var teams_to_display = []
var teams_buttons = []
var current_region_index = 0
static var regions = [
	"None",
	"Europe",
	"North America",
	"South America",
	"East Asia",
	"Southeast Asia",
	"CIS",
	"Africa and Middle East",
	"Oceania"
]
static var team_menu_item = preload("res://Prefabs/Team Menu Item.tscn")
		
func show_all_teams():
	show_teams_from_region(0)
	
func show_teams_from_next_region():
	show_teams_from_region((current_region_index + 1) % len(regions))
	
func show_teams_from_prev_region():
	show_teams_from_region((current_region_index - 1) % len(regions))
		
func show_teams_from_region(region_index):
	current_region_index = region_index
	update_teams(regions[current_region_index])
	fix_teams_button_count()
	display_teams()
	scroll_vertical = 0
		
func fix_teams_button_count():
	if len(teams_to_display) < len(teams_buttons):
		while len(teams_to_display) < len(teams_buttons):
			teams_buttons[-1].queue_free()
			teams_buttons.pop_back()
	else:
		while len(teams_to_display) > len(teams_buttons):
			var new_team_menu_item = team_menu_item.instantiate() as TeamMenuItem
			find_child("VBoxContainer").add_child(new_team_menu_item)
			teams_buttons.append(new_team_menu_item)

func display_teams():
	for i in range(len(teams_to_display)):
		teams_buttons[i].set_team(teams_to_display[i])
	
func update_teams(region):
	teams_to_display.clear()
	if region == "None":
		for reg in TeamsManager.teams_by_region:
			for team in TeamsManager.teams_by_region[reg]:
				if team.is_active == true:
					teams_to_display.append(team)
	else:
		for team in TeamsManager.teams_by_region[region]:
			if team.is_active == true:
				teams_to_display.append(team)
