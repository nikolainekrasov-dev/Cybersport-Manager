extends CanvasLayer

class_name HomeScreenController

var schedule: ScheduleController

func _ready():
	schedule = find_child("Schedule")

func update():
	schedule.update()
