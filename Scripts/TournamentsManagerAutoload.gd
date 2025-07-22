extends Node

class_name TournamentsManagerAutoload

var tournaments = []

func setup_tournaments_for_new_game():
	Match.matches.clear()
	tournaments.clear()
	for region in TeamsManager.teams_by_region:
		var tournament = null
		if region == "Europe":
			tournament = SeedingTournament.new("EU Seeding Tournament", region)
		elif region == "North America":
			tournament = SeedingTournament.new("NA Seeding Tournament", region)
		elif region == "South America":
			tournament = SeedingTournament.new("SA Seeding Tournament", region)
		elif region == "East Asia":
			tournament = SeedingTournament.new("East Asia Seeding Tournament", region)
		elif region == "Southeast Asia":
			tournament = SeedingTournament.new("SEA Seeding Tournament", region)
		elif region == "CIS":
			tournament = SeedingTournament.new("CIS Seeding Tournament", region)
		elif region == "Oceania":
			tournament = SeedingTournament.new("Oceania Seeding Tournament", region)
		else:
			tournament = SeedingTournament.new("AME Seeding Tournament", region)
		tournaments.append(tournament)
		
func get_active_tournaments():
	var active_tournaments = []
	for tournament in tournaments:
		if (EventManager.current_date.is_equal(tournament.start_date) or EventManager.current_date.is_greater(tournament.start_date)) and ((EventManager.current_date.is_equal(tournament.finish_date) or tournament.finish_date.is_greater(EventManager.current_date))):
			active_tournaments.append(weakref(tournament))
	return active_tournaments
	
func get_announced_tournaments():
	var current_tournaments = []
	for tournament in tournaments:
		if (EventManager.current_date.is_equal(tournament.announce_date) or EventManager.current_date.is_greater(tournament.announce_date)) and ((EventManager.current_date.is_equal(tournament.announce_finish_date) or tournament.announce_finish_date.is_greater(EventManager.current_date))):
			current_tournaments.append(weakref(tournament))
	return current_tournaments
