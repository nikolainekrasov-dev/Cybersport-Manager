class_name SeedingTournament

static var group_len = 5
static var group_count = 4
var name: String
var region: String
var logo: Texture2D
var participants: Array
var groups: Array
var group_records = {}
var matches: Array
var start_date: DateTime
var announce_date: DateTime
var finish_date: DateTime
var announce_finish_date: DateTime
var playoff_start_date: DateTime

func _init(tournament_name, tournament_reg):
	name = tournament_name
	region = tournament_reg
	for team in TeamsManager.teams_by_region[region]:
		if team.is_active:
			participants.append(weakref(team))
	for group in Utils.get_groups(group_count, group_len):
		var new_group = []
		for index in group:
			var group_record = {
				"Team": participants[index],
				"Matches": 0,
				"Wins": 0,
				"Loses": 0,
				"Map_Diff": 0,
				"Score": 0
			}
			new_group.append(group_record)
			group_records[participants[index].get_ref().name] = group_record
		groups.append(new_group)
	var first_tournament_day = EventManager.current_date.copy()
	first_tournament_day.add_days(5)
	var second_tournament_day = EventManager.current_date.copy()
	second_tournament_day.add_days(6)
	var third_tournament_day = EventManager.current_date.copy()
	third_tournament_day.add_days(7)
	var fourth_tournament_day = EventManager.current_date.copy()
	fourth_tournament_day.add_days(8)
	var fifth_tournament_day = EventManager.current_date.copy()
	fifth_tournament_day.add_days(9)
	playoff_start_date = EventManager.current_date.copy()
	playoff_start_date.add_days(10)
	var sixth_tournament_day = EventManager.current_date.copy()
	sixth_tournament_day.add_days(11)
	start_date = first_tournament_day
	finish_date = sixth_tournament_day
	announce_date = EventManager.current_date.copy()
	announce_finish_date = finish_date.copy()
	announce_finish_date.add_days(7)
	for group in groups:
		matches.append(weakref(Match.new(group[0]["Team"], group[1]["Team"], first_tournament_day, weakref(self), "Best of 3", "Group stage", sum_up_group_match_result)))
		matches.append(weakref(Match.new(group[2]["Team"], group[3]["Team"], first_tournament_day, weakref(self), "Best of 3", "Group stage", sum_up_group_match_result)))
		matches.append(weakref(Match.new(group[0]["Team"], group[2]["Team"], second_tournament_day, weakref(self), "Best of 3", "Group stage", sum_up_group_match_result)))
		matches.append(weakref(Match.new(group[1]["Team"], group[4]["Team"], second_tournament_day, weakref(self), "Best of 3", "Group stage", sum_up_group_match_result)))
		matches.append(weakref(Match.new(group[0]["Team"], group[3]["Team"], third_tournament_day, weakref(self), "Best of 3", "Group stage", sum_up_group_match_result)))
		matches.append(weakref(Match.new(group[2]["Team"], group[4]["Team"], third_tournament_day, weakref(self), "Best of 3", "Group stage", sum_up_group_match_result)))
		matches.append(weakref(Match.new(group[1]["Team"], group[2]["Team"], fourth_tournament_day, weakref(self), "Best of 3", "Group stage", sum_up_group_match_result)))
		matches.append(weakref(Match.new(group[3]["Team"], group[4]["Team"], fourth_tournament_day, weakref(self), "Best of 3", "Group stage", sum_up_group_match_result)))
		matches.append(weakref(Match.new(group[0]["Team"], group[4]["Team"], fifth_tournament_day, weakref(self), "Best of 3", "Group stage", sum_up_group_match_result)))
		matches.append(weakref(Match.new(group[1]["Team"], group[3]["Team"], fifth_tournament_day, weakref(self), "Best of 3", "Group stage", sum_up_group_match_result)))
		
func get_sorted_groups():
	var sorted_groups = groups.duplicate(false)
	for group in sorted_groups:
		group.sort_custom(func(a, b): return (a["Score"] > b["Score"] or a["Score"] == b["Score"] and a["Map_Diff"] > b["Map_Diff"] or a["Score"] == b["Score"] and a["Map_Diff"] == b["Map_Diff"] and get_match_result(a["Team"], b["Team"])))
	return sorted_groups
		
func get_current_stage():
	if EventManager.current_date.is_equal(playoff_start_date) or EventManager.current_date.is_greater(playoff_start_date):
		return "Play-Off"
	else:
		return "Group stage"
		
func get_match_result(first_team, second_team):
	var match_between_teams = null
	for m in matches:
		if m.first_team.get_ref() == first_team.get_ref() and m.second_team.get_ref() == second_team.get_ref() or m.first_team.get_ref() == second_team.get_ref() and m.second_team.get_ref() == first_team.get_ref():
			match_between_teams = m
			break
	if match_between_teams != null:
		return match_between_teams.first_team_score > match_between_teams.second_team_score
	return true
		
func sum_up_group_match_result(first_team_name, second_team_name, first_team_score, second_team_score):
	var winner_record = null
	var loser_record = null
	if first_team_score > second_team_score:
		winner_record = group_records[first_team_name]
		loser_record = group_records[second_team_name]
	else:
		winner_record = group_records[second_team_name]
		loser_record = group_records[first_team_name]
	winner_record["Score"] += 3
	winner_record["Matches"] += 1
	loser_record["Matches"] += 1
	winner_record["Wins"] += 1
	loser_record["Loses"] += 1
	winner_record["Map_Diff"] += abs(first_team_score - second_team_score)
	loser_record["Map_Diff"] -= abs(first_team_score - second_team_score)
