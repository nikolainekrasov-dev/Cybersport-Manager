extends CanvasLayer

class_name TournamentsScreenController

var tournaments_table: TournamentsTable

func _ready():
	tournaments_table = find_child("Tournaments Container")

func update():
	tournaments_table.update()
