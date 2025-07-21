extends LabeledTextureButton

class_name PlayerMenuItem

@onready var screen_manager: ScreenManager = get_node("/root/Screen manager") as ScreenManager
var photo: TextureRect
var nick: Label
var age: Label
var role: Label
var region: Label
var rating: Label
var free_agent: Label
var winnings: Label
var team_logo: TextureRect
var player: WeakRef

func _ready():
	super._ready()
	photo = find_child("Photo")
	nick = find_child("Nick")
	age = find_child("Age")
	role = find_child("Role")
	region = find_child("Region")
	free_agent = find_child("Free Agent")
	team_logo = find_child("Team Logo")
	rating = find_child("Rating")
	winnings = find_child("Winnings")
	connect("pressed", Callable(self, "display_player"))
	connect("mouse_entered", Callable(self, "display_white_team_logo"))
	connect("mouse_exited", Callable(self, "display_default_team_logo"))
	
func display_default_team_logo():
	if player != null and player.get_ref() != null and player.get_ref().team != null and player.get_ref().team.get_ref() != null:
		team_logo.texture = player.get_ref().team.get_ref().logo
	
func display_white_team_logo():
	if player != null and player.get_ref() != null and player.get_ref().team != null and player.get_ref().team.get_ref() != null:
		team_logo.texture = player.get_ref().team.get_ref().white_logo
	
func display_player():
	if player != null and player.get_ref() != null:
		screen_manager.show_player(player)
	
func set_player(new_player):
	if new_player != null and new_player.get_ref() != null:
		player = new_player
		photo.texture = player.get_ref().photo
		nick.text = player.get_ref().nick
		age.text = str(player.get_ref().get_age())
		role.text = player.get_ref().role
		region.text = player.get_ref().region
		rating.text = str(player.get_ref().rating)
		winnings.text = "%d$" % player.get_ref().winnings
		if player.get_ref().team != null and player.get_ref().team.get_ref() != null:
			free_agent.visible = false
			team_logo.visible = true
			team_logo.texture = player.get_ref().team.get_ref().logo
		else:
			team_logo.visible = false
			free_agent.visible = true
		
func set_white_team_logo():
	if player != null and player.get_ref() != null and player.get_ref().team != null:
		team_logo.texture = player.get_ref().team.white_logo

func set_default_team_logo():
	if player != null and player.get_ref() != null and player.get_ref().team != null:
		team_logo.texture = player.get_ref().team.logo
