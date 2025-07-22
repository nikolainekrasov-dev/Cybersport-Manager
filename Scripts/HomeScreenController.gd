extends CanvasLayer

class_name HomeScreenController

var schedule: ScheduleController
var tournaments_menu: TournamentsMenu

func _ready():
	schedule = find_child("Schedule")
	tournaments_menu = find_child("Tournaments Menu")
	EventManager.on_date_changed.append(update)

func update():
	schedule.update()
	tournaments_menu.update()
	
func refresh():
	pass
