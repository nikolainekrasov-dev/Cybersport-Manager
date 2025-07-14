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
var roster = {
	"Carry": null,
	"Assassin": null,
	"Tank": null,
	"Pusher": null,
	"Support": null
}

func _init(team_name, team_region):
	self.name = team_name
	self.region = team_region
	logo = load("res://Teams/%s/logo.png" % team_name)
	white_logo = load("res://Teams/%s/white_logo.png" % team_name)
	
func nullify_team():
	is_active = false
	games_won = 0
	games_lost = 0
	rating = start_team_rating
	total_winnings = 0
	
func winrate():
	var games_played = games_won + games_drawn + games_lost
	if games_played == 0:
		return -1
	else:
		return float(games_won) / games_played
