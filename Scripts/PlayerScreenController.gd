extends CanvasLayer

class_name PlayerScreenController

var player_photo: TextureRect
var player_rating: Label
var player_role: Label
var player_nick: Label
var player_name: Label
var player_surname: Label
var player_age: Label
var player_region: Label
var player_team: Label
var player_winnings: Label
var player_heroes_skill: HeroesSkillPanel
var player: WeakRef

func _ready():
	player_photo = find_child("Player Photo")
	player_rating = find_child("Player Rating")
	player_role = find_child("Player Role")
	player_nick = find_child("Player Nick")
	player_name = find_child("Player Name")
	player_surname = find_child("Player Surname")
	player_region = find_child("Player Region")
	player_age = find_child("Player Age")
	player_team = find_child("Player Team")
	player_winnings = find_child("Player Winnings")
	player_heroes_skill = find_child("Player Heroes Skill")

func update():
	player_photo.texture = player.get_ref().photo
	player_rating.text = str(player.get_ref().rating)
	player_nick.text = player.get_ref().nick
	player_name.text = player.get_ref().name
	player_surname.text = player.get_ref().surname
	player_region.text = player.get_ref().region
	player_age.text = str(player.get_ref().get_age())
	if player.get_ref().team != null and player.get_ref().team.get_ref() != null:
		player_team.text = player.get_ref().team.get_ref().name
	player_winnings.text = "%d $" % player.get_ref().winnings
	
	if player.get_ref().role == "Carry":
		player_role.text = "CAR"
	elif player.get_ref().role == "Assassin":
		player_role.text = "ASN"
	elif player.get_ref().role == "Tank":
		player_role.text = "TNK"
	elif player.get_ref().role == "Pusher":
		player_role.text = "PUS"
	else:
		player_role.text = "SUP"
		
	player_heroes_skill.update(player)
