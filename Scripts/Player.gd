class_name Player

static var min_birth_year = 1995
static var max_birth_year = 2010
var name: String
var surname: String
var nick: String
var photo: Texture2D
var region: String
var team: Team
var rating: int
var winnings: int
var is_active: bool = false
var birth_date: DateTime
var role: String

func _init(player_name, player_surname, player_nick, player_region, player_role, path_to_photo):
	self.name = player_name
	self.surname = player_surname
	self.nick = player_nick
	self.region = player_region
	self.team = null
	self.rating = 4500 + randi() % 1000
	self.winnings = 0
	self.role = player_role
	self.birth_date = DateTime.new(1, 1, 2005)
	self.photo = load(path_to_photo)
	self.birth_date = DateTime.get_random_date(min_birth_year, max_birth_year)
	
func get_age():
	return 18
	
