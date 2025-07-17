extends Panel

class_name PlayerIcon

@onready var screen_manager = get_node("/root/Screen manager")
@onready var player_screen = get_node("/root/Screen manager/Player")
var player_photo: TextureButton
var player_nick: Label

func _ready():
	player_nick = find_child("Nick").find_child("Label")
	player_photo = find_child("Photo")
	
func set_player(new_player):
	for conn in player_photo.get_signal_connection_list("pressed"):
		player_photo.pressed.disconnect(conn["callable"])
	if new_player != null:
		player_nick.text = new_player.nick
		player_photo.texture_normal = new_player.photo
		player_photo.connect("pressed", Callable(screen_manager, "show_player"))
		player_photo.connect("pressed", Callable(player_screen, "set_player").bind(new_player))
		
