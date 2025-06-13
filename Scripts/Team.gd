class_name Team

var name: String
var region: String
var logo: Texture2D
var white_logo: Texture2D
static var teams: Array

func _init(name, region):
	self.name = name
	self.region = region
	logo = load("res://Teams/%s/logo.png" % name)
	white_logo = load("res://Teams/%s/white_logo.png" % name)
	teams.append(self)
	
static func create_teams():
	var file = FileAccess.open("res://Teams//Teams.json", FileAccess.READ)
	var content = file.get_as_text()
	var parsed = JSON.parse_string(content)
	for region in parsed:
		for name in parsed[region]:
			Team.new(name, region)
