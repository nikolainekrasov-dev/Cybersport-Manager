extends Panel

class_name ScheduleController

@export var date: Label

func _ready():
	date = find_child("Label")
	date.text = EventManager.current_date.describe()
	EventManager.on_date_changed.append(change_date)
	
func change_date():
	date.text = EventManager.current_date.describe()
