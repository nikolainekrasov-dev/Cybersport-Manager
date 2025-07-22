extends CanvasLayer

class_name TeamsScreenController

var teams_table: TeamsTable

func _ready():
	teams_table = find_child("Teams Table")

func update():
	teams_table.update_table_content()
	
func refresh():
	pass
