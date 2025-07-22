extends CanvasLayer

class_name PlayersScreenController

var players_table: PlayersTable

func _ready():
	players_table = find_child("Players Container")

func update():
	players_table.update_table_content()
	
func refresh():
	pass
