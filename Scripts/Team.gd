class_name Team

var name: String
var region: String
var logo: Texture2D
var white_logo: Texture2D
var is_active = false

func _init(name, region):
	self.name = name
	self.region = region
	logo = load("res://Teams/%s/logo.png" % name)
	white_logo = load("res://Teams/%s/white_logo.png" % name)
