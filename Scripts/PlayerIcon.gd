extends Panel

class_name PlayerIcon

@onready var screen_manager = get_node("/root/Screen manager")
var player_photo: TextureButton
var player_nick: Label
var player: WeakRef

func _ready():
	player_nick = find_child("Nick").find_child("Label")
	player_photo = find_child("Photo")
	player_photo.connect("pressed", Callable(self, "display_player"))
	
func set_player(new_player):
	if new_player != null and new_player.get_ref() != null:
		player = new_player
		player_nick.text = player.get_ref().nick
		player_photo.texture_normal = player.get_ref().photo
		
func display_player():
	screen_manager.show_player(player)
