extends Node

class_name TodayMatches

@export var first_team_logo: TextureButton
@export var second_team_logo: TextureButton
@export var vs_label: Label
@export var tournament_name: Label
@export var stage: Label
@export var format: Label
	
func update():
	var date = EventManager.current_date.copy()
	var day_matches = []
	for m in Match.get_matches_for_date(date):
		if m.first_team != null and m.first_team.get_ref() != null and m.first_team.get_ref() == TeamsManager.player_team or m.second_team != null and m.second_team.get_ref() != null and m.second_team.get_ref() == TeamsManager.player_team:
			first_team_logo.visible = true
			second_team_logo.visible = true
			vs_label.visible = true
			tournament_name.visible = true
			tournament_name.text = m.tournament.get_ref().name
			stage.visible = true
			stage.text = m.stage
			format.visible = true
			format.text = m.format
			if m.first_team != null and m.first_team.get_ref() != null:
				first_team_logo.texture_normal = m.first_team.get_ref().logo
			if m.second_team != null and m.second_team.get_ref() != null:
				second_team_logo.texture_normal = m.second_team.get_ref().logo
			day_matches.append(m)
	if day_matches.is_empty():
		vs_label.visible = false
		first_team_logo.visible = false
		second_team_logo.visible = false
		tournament_name.visible = false
		stage.visible = false
		format.visible = false
