extends Panel

class_name TournamentGroup

var group = []
@export var teams: Array[TeamInGroup]
	
func update():
	var sorted_group = group.duplicate(false)
	sorted_group.sort_custom(func(a, b): return (a["Score"] > b["Score"] or a["Score"] == b["Score"] and a["Map_Diff"] > b["Map_Diff"]))
	for i in range(len(teams)):
		teams[i].team_result = sorted_group[i]
		teams[i].update()
