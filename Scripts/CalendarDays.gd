extends Panel

class_name CalendarDays

@export var days: Array[CalendarDay]

func update(date):
	for day in range(len(days)):
		if day < DateTime.day_in_month[date.month]:
			var new_date = DateTime.new(day + 1, date.month, date.year)
			days[day].visible = true
			var player_match = Match.get_player_match_for_date(new_date)
			days[day].update(player_match)
		else:
			days[day].update(null)
			days[day].visible = false
	
func refresh():
	pass
