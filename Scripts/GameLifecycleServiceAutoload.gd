extends Node

class_name GameLifecycleServiceAutoload

func start_new_game(player_team):
	HeroesManager.setup_heroes_for_new_game()
	PlayersManager.setup_players_for_new_game()
	TeamsManager.setup_teams_for_new_game(player_team)
	EventManager.setup_new_game()
	TournamentsManager.setup_tournaments_for_new_game()

func load_game():
	pass
	
func save_load():
	pass
