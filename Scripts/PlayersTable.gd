extends ScrollContainer

class_name PlayersTable

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

static var roles = [
	"None",
	"Carry",
	"Assassin",
	"Tank",
	"Pusher",
	"Support"
]

var players_to_display = []
var players_buttons = []
var current_region_index = 0
var current_role_index = 0
var sort_by_rating = false
var sort_by_age = false
var sort_by_winnings = false
var sort_order = "Des"

static var player_menu_item = preload("res://Prefabs/Player Menu Item.tscn")

func _ready():
	for i in range(PlayersManager.player_count):
		var new_player_menu_item = player_menu_item.instantiate() as PlayerMenuItem
		find_child("VBoxContainer").add_child(new_player_menu_item)
		players_buttons.append(new_player_menu_item)

func set_rating_flag():
	sort_by_rating = true
	sort_by_age = false
	sort_by_winnings = false

func update_table_content():
	scroll_vertical = 0
	update_players()
	if sort_by_rating and sort_order == "Des":
		players_to_display.sort_custom(func(a, b): return a.get_ref().rating > b.get_ref().rating)
	elif sort_by_rating and sort_order == "Asc":
		players_to_display.sort_custom(func(a, b): return a.get_ref().rating < b.get_ref().rating)
	elif sort_by_age and sort_order == "Des":
		players_to_display.sort_custom(func(a, b): return a.get_ref().get_age() > b.get_ref().get_age())
	elif sort_by_age and sort_order == "Asc":
		players_to_display.sort_custom(func(a, b): return a.get_ref().get_age() < b.get_ref().get_age())
	elif sort_by_winnings and sort_order == "Des":
		players_to_display.sort_custom(func(a, b): return a.get_ref().winnings > b.get_ref().winnings)
	elif sort_by_winnings and sort_order == "Asc":
		players_to_display.sort_custom(func(a, b): return a.get_ref().winnings < b.get_ref().winnings)
	else:
		players_to_display.sort_custom(func(a, b): return a.get_ref().nick < b.get_ref().nick)
	display_players()

func update_players():
	players_to_display.clear()
	var region = regions[current_region_index]
	var role = roles[current_role_index]
	if region != "None" and role != "None":
		for player in PlayersManager.players_by_region_and_role[region][role]:
			if player.is_active:
				players_to_display.append(weakref(player))
	elif region != "None" and role == "None":
		for player in PlayersManager.players_by_region[region]:
			if player.is_active:
				players_to_display.append(weakref(player))
	elif region == "None" and role != "None":
		for player in PlayersManager.players_by_role[role]:
			if player.is_active:
				players_to_display.append(weakref(player))
	else:
		for player in PlayersManager.sorted_players:
			if player.is_active:
				players_to_display.append(weakref(player))
				
func display_players():
	for i in range(len(players_buttons)):
		if i < len(players_to_display):
			players_buttons[i].show()
			players_buttons[i].set_player(players_to_display[i])
		else:
			players_buttons[i].hide()

func sort_table_by_rating_in_ascending_order():
	if sort_by_rating and sort_order == "Asc":
		sort_by_rating = false
	else:
		sort_by_age = false
		sort_by_winnings = false
		sort_by_rating = true
		sort_order = "Asc"
	update_table_content()
	
func sort_table_by_rating_in_descending_order():
	if sort_by_rating and sort_order == "Des":
		sort_by_rating = false
	else:
		sort_by_age = false
		sort_by_winnings = false
		sort_by_rating = true
		sort_order = "Des"
	update_table_content()
	
func sort_table_by_age_in_descending_order():
	if sort_by_age and sort_order == "Des":
		sort_by_age = false
	else:
		sort_by_rating = false
		sort_by_winnings = false
		sort_by_age = true
		sort_order = "Des"
	update_table_content()
	
func sort_table_by_age_in_ascending_order():
	if sort_by_age and sort_order == "Asc":
		sort_by_age = false
	else:
		sort_by_rating = false
		sort_by_winnings = false
		sort_by_age = true
		sort_order = "Asc"
	update_table_content()

func sort_table_by_winnings_in_descending_order():
	if sort_by_winnings and sort_order == "Des":
		sort_by_winnings = false
	else:
		sort_by_rating = false
		sort_by_age = false
		sort_by_winnings = true
		sort_order = "Des"
	update_table_content()
	
func sort_table_by_winnings_in_ascending_order():
	if sort_by_winnings and sort_order == "Asc":
		sort_by_winnings = false
	else:
		sort_by_rating = false
		sort_by_age = false
		sort_by_winnings = true
		sort_order = "Asc"
	update_table_content()

func set_next_region():
	current_region_index = (current_region_index + 1) % len(regions)
	update_table_content()
	
func set_prev_region():
	current_region_index = (current_region_index - 1) % len(regions)
	update_table_content()
	
func set_next_role():
	current_role_index = (current_role_index + 1) % len(roles)
	update_table_content()
	
func set_prev_role():
	current_role_index = (current_role_index - 1) % len(roles)
	update_table_content()
