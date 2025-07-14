extends Panel

class_name PlayerIcon

var player_photo: TextureRect
var player_nick: Label
var player: Player

func _ready():
	player_nick = find_child("Nick").find_child("Label")
	player_photo = find_child("Photo")
	
func set_player(new_player):
	if new_player != null:
		player = new_player
		player_nick.text = player.nick
		player_photo.texture = player.photo
