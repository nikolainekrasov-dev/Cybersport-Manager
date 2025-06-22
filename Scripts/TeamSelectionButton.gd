extends LabeledTextureButton

class_name TeamSelectionButton

var team: Team
var team_logo: TextureRect
var team_name: Label
@onready var loading_screen: LoadingScreenController = get_node("/root/Screen manager/Loading")

func _ready():
	super._ready()
	team_logo = find_child("Team Logo")
	team_name = find_child("Team Name")
	connect("mouse_entered", Callable(self, "set_white_logo"))
	connect("mouse_exited", Callable(self, "set_default_logo"))
	connect("pressed", Callable(self, "choose_team"))

func choose_team():
	loading_screen.load_new_game(team)

func set_team(new_team):
	self.team = new_team
	team_logo.texture = new_team.logo
	team_name.text = new_team.name
	
func set_white_logo():
	team_logo.texture = self.team.white_logo
	
func set_default_logo():
	team_logo.texture = self.team.logo
