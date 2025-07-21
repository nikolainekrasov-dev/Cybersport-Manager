class_name Player

static var max_hero_skill_at_start = 51
static var min_birth_year = 1995
static var max_birth_year = 2010
var name: String
var surname: String
var nick: String
var photo: Texture2D
var region: String
var team: WeakRef
var rating: int
var winnings: int
var is_active: bool = false
var is_retired: bool = false
var birth_date: DateTime
var role: String
var heroes_skill = {}

func _init(player_name, player_surname, player_nick, player_region, player_role, path_to_photo):
	self.name = player_name
	self.surname = player_surname
	self.nick = player_nick
	self.region = player_region
	self.rating = 4500 + randi() % 1000
	self.winnings = 0
	self.role = player_role
	self.birth_date = DateTime.new(1, 1, 2005)
	self.photo = load(path_to_photo)
	self.birth_date = DateTime.get_random_date(min_birth_year, max_birth_year)
	for hero in HeroesManager.heroes:
		heroes_skill[hero] = randi() % max_hero_skill_at_start
	
func get_age():
	return DateTime.get_years_between_dates(birth_date, EventManager.current_date)
	
