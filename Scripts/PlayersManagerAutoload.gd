extends Node

class_name PlayersManagerAutoload

var players_by_region = {
	"Europe": [],
	"North America": [],
	"South America": [],
	"East Asia": [],
	"Southeast Asia": [],
	"CIS": [],
	"Africa and Middle East": [],
	"Oceania": []
}

var players_by_role = {
	"Carry": [],
	"Assassin": [],
	"Tank": [],
	"Pusher": [],
	"Support": []
}

static var player_count = 1600

var sorted_players = []

func setup_players_for_new_game():
	clear_players()
	var nicks = _readlines("res://Players/nicknames.txt")
	var threads = []
	for region in players_by_region:
		var new_thread = Thread.new()
		new_thread.start(Callable(self, "create_player_from_region").bind(region))
		threads.append(new_thread)
	for thread in threads:
		thread.wait_to_finish()
	for region in players_by_region:
		sorted_players += players_by_region[region]
	sorted_players.sort_custom(func(p1, p2): return p1.nick < p2.nick)

func create_player_from_region(region):
	var nicks = _readlines("res://Players/%s/nicknames.txt" % region)
	var index = 0
	for country in DirAccess.open("res://Players/%s" % region).get_directories():
		var photos = _get_player_photos(region, country)
		var names = _readlines("res://Players/%s/%s/Names.txt" % [region, country])
		var surnames = _readlines("res://Players/%s/%s/Surnames.txt" % [region, country])
		for photo in photos:
			var nick_index = randi() % len(nicks)
			var player = Player.new(names[randi() % len(names)], surnames[randi() % len(surnames)], nicks[nick_index], region, players_by_role.keys()[index % 5], "res://Players/%s/%s/%s" % [region, country, photo])
			players_by_region[region].append(player)
			nicks.remove_at(nick_index)
			index += 1

func clear_players():
	for region in players_by_region:
		players_by_region[region].clear()
	for role in players_by_role:
		players_by_role[role].clear()
	sorted_players.clear()
		
func _get_player_photos(region, country):
	var photos = []
	for file in DirAccess.open("res://Players/%s/%s" % [region, country]).get_files():
		if file != "Names.txt" and file != "Surnames.txt":
			photos.append(file.replace(".import", ""))
	return photos
	
func _readlines(path_to_file):
	var file = FileAccess.open(path_to_file, FileAccess.READ)
	var lines = []
	while not file.eof_reached():
		var line = file.get_line().strip_edges()
		lines.append(line)
	return lines
