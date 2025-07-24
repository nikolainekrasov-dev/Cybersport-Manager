extends LabeledTextureButton

class_name CalendarDay

@export var first_team_logo: TextureRect
@export var second_team_logo: TextureRect
@export var tournament_name: Label
@export var vs_label: Label
var day_match: WeakRef

func _ready():
	super._ready()
	connect("mouse_entered", Callable(self, "set_white_logos"))
	connect("mouse_exited", Callable(self, "set_default_logos"))

func update(new_match):
	day_match = new_match
	if day_match != null and day_match.get_ref() != null:
		focus_mode = Control.FOCUS_ALL
		disabled = false
		vs_label.visible = true
		var match_ref = day_match.get_ref()
		if match_ref.first_team and match_ref.first_team.get_ref() != null:
			first_team_logo.visible = true
			first_team_logo.texture = match_ref.first_team.get_ref().logo
		if match_ref.second_team and match_ref.second_team.get_ref() != null:
			second_team_logo.visible = true
			second_team_logo.texture = match_ref.second_team.get_ref().logo
		if match_ref.tournament.get_ref() != null:
			tournament_name.visible = true
			tournament_name.text = match_ref.tournament.get_ref().name
	else:
		vs_label.visible = false
		first_team_logo.visible = false
		second_team_logo.visible = false
		tournament_name.visible = false
		focus_mode = Control.FOCUS_NONE

func set_white_logos():
	if day_match != null and day_match.get_ref() != null:
		if day_match.get_ref().first_team and day_match.get_ref().first_team.get_ref():
			first_team_logo.texture = day_match.get_ref().first_team.get_ref().white_logo
		if day_match.get_ref().second_team and day_match.get_ref().second_team.get_ref():
			second_team_logo.texture = day_match.get_ref().second_team.get_ref().white_logo

func set_default_logos():
	if day_match != null and day_match.get_ref() != null:
		if day_match.get_ref().first_team and day_match.get_ref().first_team.get_ref():
			first_team_logo.texture = day_match.get_ref().first_team.get_ref().logo
		if day_match.get_ref().second_team and day_match.get_ref().second_team.get_ref():
			second_team_logo.texture = day_match.get_ref().second_team.get_ref().logo
