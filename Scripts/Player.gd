class_name Player

var name: String
var surname: String
var nick: String
var photo: Texture2D
var region: String
var is_active: bool = false

func _init(name, surname, nick, region, path_to_photo):
	self.name = name
	self.surname = surname
	self.nick = nick
	self.region = region
	self.photo = load(path_to_photo)
	
