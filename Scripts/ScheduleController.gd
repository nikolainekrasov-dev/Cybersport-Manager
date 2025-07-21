extends Panel

class_name ScheduleController

var days: Array
var today_date: Label
var today_matches: TodayMatches

func _ready():
	days = [find_child("First Day"), find_child("Second Day"),
		find_child("Third Day"), find_child("Fourth Day"),
		find_child("Fifth Day"), find_child("Sixth Day")]
	today_date = find_child("Today Date").find_child("Label")
	today_matches = find_child("Today Matches")
	EventManager.on_date_changed.append(update)
	
func update():
	for day in days:
		day.change_number()
	today_date.text = EventManager.current_date.describe()
	today_matches.update()
