extends CanvasLayer

class_name TeamsScreenController

@export var teams_table: TeamsTable

func update():
	teams_table.update_table_content()
	
func refresh():
	pass
