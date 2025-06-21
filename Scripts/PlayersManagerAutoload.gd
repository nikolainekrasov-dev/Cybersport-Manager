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

func setup_players_for_new_game():
	var nicks = _readlines("res://Players/nicknames.txt")
	for region in players_by_region:
		for country in DirAccess.open("res://Players/%s" % region).get_directories():
			var photos = _get_player_photos(region, country)
			var names = _readlines("res://Players/%s/%s/Names.txt" % [region, country])
			var surnames = _readlines("res://Players/%s/%s/Surnames.txt" % [region, country])
			for photo in photos:
				var nick_index = randi() % len(nicks)
				var player = Player.new(names[randi() % len(names)], surnames[randi() % len(surnames)], nicks[nick_index], region, "res://Players/%s/%s/%s" % [region, country, photo])
				players_by_region[region].append(player)
				nicks.remove_at(nick_index)
			

func clear_players():
	for region in players_by_region:
		players_by_region[region].clear()
		
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
