class_name Match

var first_team: WeakRef
var second_team: WeakRef
var date: DateTime
var tournament: WeakRef
var format: String
var stage: String
static var matches: Array

func _init(first_team_in_match, second_team_in_match, match_date,
		match_tournament, match_format, match_stage):
	first_team = first_team_in_match
	second_team = second_team_in_match
	date = match_date
	tournament = match_tournament
	format = match_format
	stage = match_stage
	matches.append(self)
	
static func get_matches_for_date(date):
	var matches_for_date = []
	for m in matches:
		if m.date.is_equal(date):
			matches_for_date.append(m)
	return matches_for_date
