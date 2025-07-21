extends Node

class_name TournamentsManagerAutoload

var tournaments = []

func setup_tournaments_for_new_game():
	Match.matches.clear()
	tournaments.clear()
	for region in TeamsManager.teams_by_region:
		var tournament = SeedingTournament.new("Seeding Tournament", region)
		tournaments.append(tournament)
