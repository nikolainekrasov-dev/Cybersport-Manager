class_name SeedingTournament

static var group_len = 5
static var group_count = 4
var name: String
var region: String
var logo: Texture2D
var participants: Array
var groups: Array
var matches: Array

func _init(tournament_name, tournament_reg):
	name = tournament_name
	region = tournament_reg
	for team in TeamsManager.teams_by_region[region]:
		if team.is_active:
			participants.append(weakref(team))
	var temp = Utils.get_groups(group_count, group_len)
	for group in Utils.get_groups(group_count, group_len):
		groups.append([participants[group[0]],
				participants[group[1]], participants[group[2]],
				participants[group[3]], participants[group[4]]])
	var first_tournament_day = EventManager.current_date.copy()
	first_tournament_day.add_days(7)
	var second_tournament_day = EventManager.current_date.copy()
	second_tournament_day.add_days(8)
	var third_tournament_day = EventManager.current_date.copy()
	third_tournament_day.add_days(9)
	var fourth_tournament_day = EventManager.current_date.copy()
	fourth_tournament_day.add_days(10)
	var fifth_tournament_day = EventManager.current_date.copy()
	fifth_tournament_day.add_days(11)
	for group in groups:
		matches.append(weakref(Match.new(group[0], group[1], first_tournament_day, weakref(self), "Best of 3", "Group stage")))
		matches.append(weakref(Match.new(group[2], group[3], first_tournament_day, weakref(self), "Best of 3", "Group stage")))
		matches.append(weakref(Match.new(group[0], group[2], second_tournament_day, weakref(self), "Best of 3", "Group stage")))
		matches.append(weakref(Match.new(group[1], group[4], second_tournament_day, weakref(self), "Best of 3", "Group stage")))
		matches.append(weakref(Match.new(group[0], group[3], third_tournament_day, weakref(self), "Best of 3", "Group stage")))
		matches.append(weakref(Match.new(group[2], group[4], third_tournament_day, weakref(self), "Best of 3", "Group stage")))
		matches.append(weakref(Match.new(group[1], group[2], fourth_tournament_day, weakref(self), "Best of 3", "Group stage")))
		matches.append(weakref(Match.new(group[3], group[4], fourth_tournament_day, weakref(self), "Best of 3", "Group stage")))
		matches.append(weakref(Match.new(group[0], group[4], fifth_tournament_day, weakref(self), "Best of 3", "Group stage")))
		matches.append(weakref(Match.new(group[1], group[3], fifth_tournament_day, weakref(self), "Best of 3", "Group stage")))
