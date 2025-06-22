extends LabeledTextureButton

class_name TeamMenuItem

@export var team_logo: TextureRect
@export var team_name: Label
@export var team_region: Label
@export var team_rating: Label
@export var team_winrate: Label
@export var team_total_winnings: Label
var team: Team
@onready var team_screen: TeamScreenController = get_node("/root/Screen manager/Team")

func _ready():
	super._ready()
	team_logo = find_child("Logo")
	team_name = find_child("Name")
	connect("mouse_entered", Callable(self, "set_white_team_logo"))
	connect("mouse_exited", Callable(self, "set_default_team_logo"))
	connect("pressed", Callable(self, "show_team_info"))
	
func show_team_info():
	team_screen.set_team(team)
	
func set_team(new_team):
	self.team = new_team
	team_logo.texture = new_team.logo
	team_name.text = str(new_team.name)
	team_rating.text = str(new_team.rating)
	team_region.text = new_team.region
	var team_wr = new_team.winrate()
	if team_wr != -1:
		team_winrate.text = str(team_wr)
	else:
		team_winrate.text = "-"
	team_total_winnings.text = "%d$" % new_team.total_winnings
		
func set_white_team_logo():
	team_logo.texture = self.team.white_logo
	
func set_default_team_logo():
	team_logo.texture = self.team.logo
