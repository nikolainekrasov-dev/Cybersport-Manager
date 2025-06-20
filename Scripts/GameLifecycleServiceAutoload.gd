extends Node

class_name GameLifecycleServiceAutoload

func start_new_game(player_team):
	TeamsManager.setup_teams_for_new_game(player_team)
	PlayersManager.setup_players_for_new_game()
	EventManager.setup_new_game()

func load_game():
	pass
	
func save_load():
	pass
