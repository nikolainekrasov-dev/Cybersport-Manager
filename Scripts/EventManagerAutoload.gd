extends Node

class_name EventManagerAutoload

static var start_date = DateTime.new(1, 0, 2025)
var on_date_changed = []
var current_date: DateTime = null

func _ready():
	current_date = start_date.copy()
	
func setup_new_game():
	current_date = start_date.copy()

func move_to_date(date):
	while not(current_date.is_equal(date)):
		for m in Match.get_matches_for_date(current_date):
			m.play()
		current_date.add_day()
		for event in on_date_changed:
			event.call()
