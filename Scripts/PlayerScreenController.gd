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

func set_player(player):
	player_photo.texture = player.photo
	player_rating.text = str(player.rating)
	player_nick.text = player.nick
	player_name.text = player.name
	player_surname.text = player.surname
	player_region.text = player.region
	player_age.text = str(player.get_age())
	if player.team != null:
		player_team.text = player.team.name
	player_winnings.text = "%d $" % player.winnings
	
	if player.role == "Carry":
		player_role.text = "CAR"
	elif player.role == "Assassin":
		player_role.text = "ASN"
	elif player.role == "Tank":
		player_role.text = "TNK"
	elif player.role == "Pusher":
		player_role.text = "PUS"
	else:
		player_role.text = "SUP"
		
	player_heroes_skill.update(player)
