extends ScrollContainer

class_name TeamsTable

var teams_to_display = []
var teams_buttons = []
var current_region_index = 0
var sort_by_rating = false
var sort_by_winrate = false
var sort_by_winnings = false
var sort_order = "Des"
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

func _ready():
	for i in range(TeamsManager.teams_count / 2):
		var new_team_menu_item = team_menu_item.instantiate() as TeamMenuItem
		find_child("VBoxContainer").add_child(new_team_menu_item)
		teams_buttons.append(new_team_menu_item)

func update_table_content():
	scroll_vertical = 0
	update_teams()
	if sort_by_rating and sort_order == "Des":
		teams_to_display.sort_custom(func(a, b): return a.get_ref().rating > b.get_ref().rating)
	elif sort_by_rating and sort_order == "Asc":
		teams_to_display.sort_custom(func(a, b): return a.get_ref().rating < b.get_ref().rating)
	elif sort_by_winrate and sort_order == "Des":
		teams_to_display.sort_custom(func(a, b): return a.get_ref().winrate() > b.get_ref().winrate())
	elif sort_by_winrate and sort_order == "Asc":
		teams_to_display.sort_custom(func(a, b): return a.get_ref().winrate() < b.get_ref().winrate())
	elif sort_by_winnings and sort_order == "Des":
		teams_to_display.sort_custom(func(a, b): return a.get_ref().total_winnings > b.get_ref().total_winnings)
	elif sort_by_winnings and sort_order == "Asc":
		teams_to_display.sort_custom(func(a, b): return a.get_ref().total_winnings < b.get_ref().total_winnings)
	else:
		teams_to_display.sort_custom(func(a, b): return a.get_ref().name < b.get_ref().name)
	display_teams()
	
func sort_table_by_rating_in_ascending_order():
	if sort_by_rating and sort_order == "Asc":
		sort_by_rating = false
	else:
		sort_by_winrate = false
		sort_by_winnings = false
		sort_by_rating = true
		sort_order = "Asc"
	update_table_content()
	
func sort_table_by_rating_in_descending_order():
	if sort_by_rating and sort_order == "Des":
		sort_by_rating = false
	else:
		sort_by_winrate = false
		sort_by_winnings = false
		sort_by_rating = true
		sort_order = "Des"
	update_table_content()
	
func sort_table_by_winrate_in_ascending_order():
	if sort_by_winrate and sort_order == "Asc":
		sort_by_winrate = false
	else:
		sort_by_winrate = false
		sort_by_winnings = false
		sort_by_rating = true
		sort_order = "Asc"
	update_table_content()
	
func sort_table_by_winrate_in_descending_order():
	if sort_by_winrate and sort_order == "Des":
		sort_by_winrate = false
	else:
		sort_by_winrate = true
		sort_by_winnings = false
		sort_by_rating = false
		sort_order = "Des"
	update_table_content()
	
func sort_table_by_winnings_in_ascending_order():
	if sort_by_winnings and sort_order == "Asc":
		sort_by_winnings = false
	else:
		sort_by_winrate = false
		sort_by_winnings = true
		sort_by_rating = false
		sort_order = "Asc"
	update_table_content()
	
func sort_table_by_winnings_in_descending_order():
	if sort_by_winnings and sort_order == "Des":
		sort_by_winnings = false
	else:
		sort_by_winrate = false
		sort_by_winnings = true
		sort_by_rating = false
		sort_order = "Des"
	update_table_content()
	
func display_teams():
	for i in range(len(teams_buttons)):
		if i < len(teams_to_display):
			teams_buttons[i].show()
			teams_buttons[i].set_team(teams_to_display[i])
		else:
			teams_buttons[i].hide()
	
func update_teams():
	teams_to_display.clear()
	var region = regions[current_region_index]
	if region == "None":
		for team in TeamsManager.all_teams:
			if team.is_active:
				teams_to_display.append(weakref(team))
	else:
		for team in TeamsManager.teams_by_region[region]:
			if team.is_active:
				teams_to_display.append(weakref(team))

func set_next_region():
	current_region_index = (current_region_index + 1) % len(regions)
	update_table_content()
	
func set_prev_region():
	current_region_index = (current_region_index - 1) % len(regions)
	update_table_content()

func nullify():
	sort_by_winnings = false
	sort_by_winrate = false
	sort_by_rating = false
	sort_order = "Des"
	current_region_index = 0
