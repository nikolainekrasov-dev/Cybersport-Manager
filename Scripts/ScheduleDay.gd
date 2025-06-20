extends TextureButton

class_name ScheduleDay

@export var shift: int
var date: DateTime
var number_label: Label

func _ready():
	number_label = find_child("Number")
	date = EventManager.current_date.copy()
	date.add_days(shift)
	number_label.text = str(date.day).pad_zeros(2)
	EventManager.on_date_changed.append(change_number)
	connect("pressed", Callable(self, "move_to_date"))
	
func change_number():
	date = EventManager.current_date.copy()
	date.add_days(shift)
	number_label.text = str(date.day).pad_zeros(2)
	
func move_to_date():
	EventManager.move_to_date(date)
