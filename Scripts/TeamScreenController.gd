extends CanvasLayer

class_name TeamScreenController

var team_name: Label
var team_logo: TextureRect
var team_rating: Label
var team_region: Label
var team_winnings: Label
var roster = null
var team: WeakRef
@export var the_first_match: MatchMenuItem
@export var the_second_match: MatchMenuItem
@export var the_third_match: MatchMenuItem

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

func update(new_team):
	team = new_team
	if team != null and team.get_ref() != null:
		var team_ref = team.get_ref()
		team_name.text = team_ref.name
		team_rating.text = str(team_ref.rating)
		team_winnings.text = str(team_ref.total_winnings)
		team_region.text = team_ref.region
		team_logo.texture = team_ref.logo
		for player_role in team_ref.roster:
			roster[player_role].update(team_ref.roster[player_role])
		var matches = Match.get_past_sorted_matches_for_team(team)
		if len(matches) == 0:
			the_first_match.visible = false
			the_second_match.visible = false
			the_third_match.visible = false
		elif len(matches) == 1:
			the_first_match.visible = true
			the_first_match.update(weakref(matches[0]))
			the_second_match.visible = false
			the_third_match.visible = false
		elif len(matches) == 2:
			the_first_match.visible = true
			the_first_match.update(weakref(matches[0]))
			the_second_match.visible = true
			the_second_match.update(weakref(matches[1]))
			the_third_match.visible = false
		else:
			the_first_match.visible = true
			the_first_match.update(weakref(matches[0]))
			the_second_match.visible = true
			the_second_match.update(weakref(matches[1]))
			the_third_match.visible = true
			the_third_match.update(weakref(matches[2]))

func refresh():
	pass
