extends TextureButton

class_name TeamInGroup

var team_logo: TextureRect
var team_name: Label
var matches: Label
var wins: Label
var loses: Label
var map_diff: Label
var score: Label
var team_result = {}
@onready var screen_manager = get_node("/root/Screen manager") as ScreenManager

func _ready():
	team_logo = find_child("Team Logo")
	team_name = find_child("Team Name")
	matches = find_child("Matches")
	wins = find_child("Wins")
	loses = find_child("Loses")
	map_diff = find_child("Map Diff")
	score = find_child("Score")
	connect("pressed", Callable(self, "display_team"))
	
func update():
	team_logo.texture = team_result["Team"].get_ref().logo
	team_name.text = team_result["Team"].get_ref().name
	matches.text = str(team_result["Matches"])
	wins.text = str(team_result["Wins"])
	loses.text = str(team_result["Loses"])
	map_diff.text = str(team_result["Map_Diff"])
	score.text = str(team_result["Score"])
	
func display_team():
	screen_manager.show_team(team_result["Team"])
