class_name Team

static var start_team_rating = 3000

var name: String
var region: String
var logo: Texture2D
var white_logo: Texture2D
var is_active = false
var games_won = 0
var games_drawn = 0
var games_lost = 0
var rating = start_team_rating
var total_winnings = 0

func _init(name, region):
	self.name = name
	self.region = region
	logo = load("res://Teams/%s/logo.png" % name)
	white_logo = load("res://Teams/%s/white_logo.png" % name)
	
func nullify_team():
	is_active = false
	games_won = 0
	games_lost = 0
	rating = randi() % 10000
	total_winnings = randi() % 10000000
	
func winrate():
	var games_played = games_won + games_drawn + games_lost
	if games_played == 0:
		return -1
	else:
		return games_won / games_played
