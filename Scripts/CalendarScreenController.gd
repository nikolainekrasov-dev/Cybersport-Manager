extends CanvasLayer

class_name CalendarScreenController

@export var date_label: Label
@export var days: CalendarDays
var date_to_display: DateTime

func update():
	date_to_display = EventManager.current_date
	_update_components()
	
func _update_components():
	date_label.text = date_to_display.describe().substr(3)
	days.update(date_to_display)
	
func refresh():
	pass
	
func show_prev_month():
	if date_to_display.month == 0:
		date_to_display = DateTime.new(1, 11, date_to_display.year - 1)
	else:
		date_to_display = DateTime.new(1, date_to_display.month - 1, date_to_display.year)
	_update_components()
	
func show_next_month():
	if date_to_display.month == 11:
		date_to_display = DateTime.new(1, 0, date_to_display.year + 1)
	else:
		date_to_display = DateTime.new(1, date_to_display.month + 1, date_to_display.year)
	_update_components()
