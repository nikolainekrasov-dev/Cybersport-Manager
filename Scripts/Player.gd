class_name Player

var name: String
var surname: String
var nick: String
var photo: Texture2D
var region: String
var team: Team
var rating: int
var winnings: int
var is_active: bool = false

func _init(player_name, player_surname, player_nick, player_region, path_to_photo):
	self.name = player_name
	self.surname = player_surname
	self.nick = player_nick
	self.region = player_region
	self.team = null
	self.rating = 3000
	self.winnings = 0
	self.photo = load(path_to_photo)
	
