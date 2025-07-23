extends LabeledTextureButton

class_name MatchMenuItem

@export var first_team_logo: TextureRect
@export var second_team_logo: TextureRect
@export var result: Label
@export var date: Label
@export var stage: Label
@export var tournament_logo: TextureRect
var match_to_display: WeakRef

func update(new_match):
	match_to_display = new_match
	if match_to_display != null and match_to_display.get_ref() != null:
		first_team_logo.texture = match_to_display.get_ref().first_team.get_ref().logo
		second_team_logo.texture = match_to_display.get_ref().second_team.get_ref().logo
		date.text = match_to_display.get_ref().date.describe()
		stage.text = match_to_display.get_ref().stage
		if EventManager.current_date.is_greater(match_to_display.get_ref().date):
			result.text = "%d:%d" % [match_to_display.get_ref().first_team_score, match_to_display.get_ref().second_team_score]
