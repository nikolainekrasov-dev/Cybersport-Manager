extends Node

class_name GameLifecycleServiceAutoload

func start_new_game(player_team):
	TeamsManager.choose_teams_for_new_game(player_team)

func load_game():
	pass
	
func save_load():
	pass
