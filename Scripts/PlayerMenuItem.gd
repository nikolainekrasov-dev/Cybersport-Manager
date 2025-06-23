extends LabeledTextureButton

class_name PlayerMenuItem

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
	age.text = "26"
	region.text = new_player.region
	rating.text = str(new_player.rating)
	winnings.text = "%d$" % new_player.winnings
