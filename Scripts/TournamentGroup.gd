extends Panel

class_name TournamentGroup

var group = []
@export var teams: Array[TeamInGroup]
	
func update():
	for i in range(len(teams)):
		teams[i].team_result = group[i]
		teams[i].update()
