class_name Match

var first_team: WeakRef
var second_team: WeakRef
var first_team_score: int
var second_team_score: int
var date: DateTime
var tournament: WeakRef
var format: String
var stage: String
var callback: Callable
static var matches: Array
static var past_matches: Array
static var upcoming_matches: Array


func _init(first_team_in_match, second_team_in_match, match_date,
		match_tournament, match_format, match_stage, match_callback):
	first_team = first_team_in_match
	second_team = second_team_in_match
	date = match_date
	tournament = match_tournament
	format = match_format
	stage = match_stage
	callback = match_callback
	matches.append(self)
	upcoming_matches.append(self)
	
static func get_matches_for_date(date):
	var matches_for_date = []
	for m in matches:
		if m.date.is_equal(date):
			matches_for_date.append(m)
	return matches_for_date
	
static func get_matches_for_player(player):
	var player_matches = []
	for m in past_matches:
		if m.first_team.get_ref().has_player(player) or m.second_team.get_ref().has_player(player):
			player_matches.append(weakref(m))
	player_matches.sort_custom(func(a, b): return a.get_ref().date.is_greater(b.get_ref().date))
	return player_matches

static func get_past_sorted_matches_for_team(team):
	var matches_for_team = []
	for m in past_matches:
		if m.first_team.get_ref() == team.get_ref() or m.second_team.get_ref() == team.get_ref():
			matches_for_team.append(m)
	matches_for_team.sort_custom(func(a, b): return a.date.is_greater(b.date))
	return matches_for_team

func play():
	var winner = randi() % 2
	var winner_score = 0
	if format == "Best of 3":
		winner_score = 2
	elif format == "Best of 5":
		winner_score = 3
	var loser_score = randi() % winner_score
	if winner == 0:
		first_team_score = winner_score
		second_team_score = loser_score
	else:
		first_team_score = loser_score
		second_team_score = winner_score
	upcoming_matches.erase(self)
	past_matches.append(self)
	callback.call(first_team.get_ref().name, second_team.get_ref().name, first_team_score, second_team_score)
	
static func clear_matches():
	matches.clear()
	past_matches.clear()
	upcoming_matches.clear()
