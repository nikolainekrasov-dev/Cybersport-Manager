extends CanvasLayer

class_name TeamScreenController

var team_name: Label
var team_logo: TextureRect
var team_rating: Label
var team_region: Label
var team_winnings: Label
var roster = null

func _ready():
	team_name = find_child("Team Name").find_child("Label")
	team_logo = find_child("Team Info").find_child("Team Logo")
	team_rating = find_child("Rating")
	team_region = find_child("Region")
	team_winnings = find_child("Winnings")
	roster = {"Carry": find_child("Carry Role") as PlayerIcon,
			"Assassin": find_child("Assassin Role") as PlayerIcon,
			"Tank": find_child("Tank Role") as PlayerIcon,
			"Pusher": find_child("Pusher Role") as PlayerIcon,
			"Support": find_child("Support Role") as PlayerIcon}

func update():
	pass

func set_team(new_team):
	team_name.text = new_team.name
	team_rating.text = str(new_team.rating)
	team_winnings.text = str(new_team.total_winnings)
	team_region.text = new_team.region
	team_logo.texture = new_team.logo
	for player_role in new_team.roster:
		roster[player_role].set_player(new_team.roster[player_role])
