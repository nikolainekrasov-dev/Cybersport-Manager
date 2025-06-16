extends Panel

class_name PlayerInfoPanel

var player_team_logo: TextureRect
var player_team_name: Label
	
func _ready():
	player_team_logo = find_child("Player Team Logo")
	player_team_name = find_child("Player Team Name")
	TeamsManager.on_player_team_changed.append(set_player_team_info)
	
func set_player_team_info(player_team):
	player_team_logo.texture = player_team.white_logo
	player_team_name.text = player_team.name
