extends LabeledTextureButton

class_name TeamMenuItem

@export var team_logo: TextureRect
@export var team_name: Label
@export var team_region: Label
@export var team_rating: Label
@export var team_winrate: Label
@export var team_total_winnings: Label
@onready var screen_manager: ScreenManager = get_node("/root/Screen manager")
var team: WeakRef

func _ready():
	super._ready()
	team_logo = find_child("Logo")
	team_name = find_child("Name")
	connect("pressed", Callable(self, "display_team"))
	connect("mouse_entered", Callable(self, "set_white_team_logo"))
	connect("mouse_exited", Callable(self, "set_default_team_logo"))
	
func display_team():
	screen_manager.show_team(team)

func update(new_team):
	if new_team != null and new_team.get_ref() != null:
		team = new_team
		team_logo.texture = team.get_ref().logo
		team_name.text = str(team.get_ref().name)
		team_rating.text = str(team.get_ref().rating)
		team_region.text = team.get_ref().region
		var team_wr = team.get_ref().winrate()
		if team_wr != -1:
			team_winrate.text = str(team_wr)
		else:
			team_winrate.text = "-"
		team_total_winnings.text = "%d$" % team.get_ref().total_winnings
		
func set_white_team_logo():
	team_logo.texture = self.team.get_ref().white_logo
	
func set_default_team_logo():
	team_logo.texture = self.team.get_ref().logo
