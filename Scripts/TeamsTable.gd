extends ScrollContainer

class_name TeamsTable

var teams_to_display = []
var teams_buttons = []
var current_region_index = 0
var sort_by_rating = false
var sort_by_winrate = false
var sort_by_winnings = false
var order = "Dec"
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
	
func set_next_region():
	current_region_index  = (current_region_index + 1) % len(regions)
	
func set_prev_region():
	current_region_index  = (current_region_index - 1) % len(regions)
		
func update_table_content():
	update_teams(regions[current_region_index])
	if sort_by_rating and order == "Dec":
		teams_to_display.sort_custom(func(a, b): return a.rating > b.rating)
	elif sort_by_rating and order == "Inc":
		teams_to_display.sort_custom(func(a, b): return a.rating < b.rating)
	elif sort_by_winrate and order == "Dec":
		teams_to_display.sort_custom(func(a, b): return a.winrate() > b.winrate())
	elif sort_by_winrate and order == "Inc":
		teams_to_display.sort_custom(func(a, b): return a.winrate() < b.winrate())
	elif sort_by_winnings and order == "Dec":
		teams_to_display.sort_custom(func(a, b): return a.total_winnings > b.total_winnings)
	elif sort_by_winnings and order == "Inc":
		teams_to_display.sort_custom(func(a, b): return a.total_winnings < b.total_winnings)
	fix_teams_button_count()
	display_teams()
	scroll_vertical = 0
	
func switch_rating_flag():
	sort_by_rating = not(sort_by_rating)
	sort_by_winrate = false
	sort_by_winnings = false
	
func switch_winrate_flag():
	sort_by_rating = false
	sort_by_winrate = not(sort_by_winrate)
	sort_by_winnings = false
	
func switch_winnings_flag():
	sort_by_rating = false
	sort_by_winrate = false
	sort_by_winnings = not(sort_by_winnings)
		
func set_increase_order():
	order = "Inc"
	
func set_decrease_order():
	order = "Dec"
	
func fix_teams_button_count():
	if len(teams_to_display) < len(teams_buttons):
		while len(teams_to_display) < len(teams_buttons):
			teams_buttons[-1].queue_free()
			teams_buttons.pop_back()
	else:
		while len(teams_to_display) > len(teams_buttons):
			var new_team_menu_item = team_menu_item.instantiate() as TeamMenuItem
			new_team_menu_item.connect("pressed", Callable(get_node("/root/Screen manager"), "show_team"))
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
				
func nullify():
	sort_by_winnings = false
	sort_by_winrate = false
	sort_by_rating = false
	order = "Inc"
	current_region_index = 0
