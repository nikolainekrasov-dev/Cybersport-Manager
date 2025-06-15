extends LabeledTextureButton

class_name TeamSelectionButton

var team: Team
var team_logo: TextureRect
var team_name: Label

func _ready():
	super._ready()
	team_logo = find_child("Team Logo")
	team_name = find_child("Team Name")
	connect("mouse_entered", Callable(self, "set_white_logo"))
	connect("mouse_exited", Callable(self, "set_default_logo"))
	connect("pressed", Callable(self, "choose_team"))

func choose_team():
	GameLifecycleService.start_new_game()

func set_team(team):
	self.team = team
	team_logo.texture = team.logo
	team_name.text = team.name
	
func set_white_logo():
	team_logo.texture = self.team.white_logo
	
func set_default_logo():
	team_logo.texture = self.team.logo
