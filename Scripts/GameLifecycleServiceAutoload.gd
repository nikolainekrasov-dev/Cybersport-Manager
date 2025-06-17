extends Node

class_name GameLifecycleServiceAutoload

func start_new_game(player_team):
	TeamsManager.choose_teams_for_new_game(player_team)
	PlayersManager.create_new_players()

func load_game():
	pass
	
func save_load():
	pass
