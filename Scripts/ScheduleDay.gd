extends TextureButton

class_name ScheduleDay

@export var shift: int
var date: DateTime
var number_label: Label
var vs_label: Label
var first_team_logo: TextureRect
var second_team_logo: TextureRect
var day_matches: Array

func _ready():
	number_label = find_child("Number")
	first_team_logo = find_child("First Team Logo")
	second_team_logo = find_child("Second Team Logo")
	vs_label = find_child("VS")
	vs_label.visible = false
	date = EventManager.current_date.copy()
	date.add_days(shift)
	number_label.text = str(date.day).pad_zeros(2)
	EventManager.on_date_changed.append(change_number)
	connect("pressed", Callable(self, "move_to_date"))
	
func change_number():
	date = EventManager.current_date.copy()
	date.add_days(shift)
	number_label.text = str(date.day).pad_zeros(2)
	day_matches = []
	for m in Match.get_matches_for_date(date):
		if m.first_team != null and m.first_team.get_ref() == TeamsManager.player_team or m.second_team != null and m.second_team.get_ref() == TeamsManager.player_team:
			first_team_logo.visible = true
			second_team_logo.visible = true
			vs_label.visible = true
			if m.first_team != null and m.first_team.get_ref() != null:
				first_team_logo.texture = m.first_team.get_ref().logo
			if m.second_team != null and m.second_team.get_ref() != null:
				second_team_logo.texture = m.second_team.get_ref().logo
			day_matches.append(m)
	if day_matches.is_empty():
		vs_label.visible = false
		first_team_logo.visible = false
		second_team_logo.visible = false
	
func move_to_date():
	EventManager.move_to_date(date)
