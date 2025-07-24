extends CanvasLayer

class_name MatchesScreenController

@export var matches_table: MatchesTable

func update():
	matches_table.update()
	
func refresh():
	matches_table.refresh()
