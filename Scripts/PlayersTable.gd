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

var players_to_display = []
var players_buttons = []
var current_region_index = 0

static var player_menu_item = preload("res://Prefabs/Player Menu Item.tscn")

func update_table_content():
	update_players(regions[current_region_index])
	fix_players_button_count()
	display_players()
	scroll_vertical = 0

func display_players():
	for i in range(len(players_to_display)):
		players_buttons[i].set_player(players_to_display[i])

func update_players(region):
	players_to_display.clear()
	if region == "None":
		for reg in PlayersManager.players_by_region:
			print(reg)
			print(len(PlayersManager.players_by_region[reg]))
			for player in PlayersManager.players_by_region[reg]:
				players_to_display.append(player)
	else:
		for player in PlayersManager.players_by_region[region]:
			players_to_display.append(player)
				
func fix_players_button_count():
	if len(players_to_display) < len(players_buttons):
		while len(players_to_display) < len(players_buttons):
			players_buttons[-1].queue_free()
			players_buttons.pop_back()
	else:
		while len(players_to_display) > len(players_buttons):
			var new_player_menu_item = player_menu_item.instantiate() as PlayerMenuItem
			find_child("VBoxContainer").add_child(new_player_menu_item)
			players_buttons.append(new_player_menu_item)
