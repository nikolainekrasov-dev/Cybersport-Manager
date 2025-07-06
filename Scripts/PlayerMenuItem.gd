extends LabeledTextureButton

class_name PlayerMenuItem

@onready var player_screen: PlayerScreenController = get_node("/root/Screen manager/Player")
var photo: TextureRect
var nick: Label
var age: Label
var role: Label
var region: Label
var rating: Label
var free_agent: Label
var winnings: Label
var team_logo: TextureRect
var player: Player

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
	
	
func set_player(new_player):
	player = new_player
	photo.texture = new_player.photo
	nick.text = new_player.nick
	age.text = str(new_player.get_age())
	role.text = new_player.role
	region.text = new_player.region
	rating.text = str(new_player.rating)
	winnings.text = "%d$" % new_player.winnings
	if new_player.team != null:
		free_agent.visible = false
		team_logo.visible = true
		team_logo.texture = new_player.team.logo
	else:
		team_logo.visible = false
		free_agent.visible = true
		
func set_white_team_logo():
	if player.team != null:
		team_logo.texture = player.team.white_logo

func set_default_team_logo():
	if player.team != null:
		team_logo.texture = player.team.logo
