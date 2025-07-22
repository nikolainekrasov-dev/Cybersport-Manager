extends Panel

class_name SeedingTournamentGroupStageMenuBody

var groups = {}
var tournament: WeakRef

func _ready():
	groups = {
		"Group A": find_child("Group A") as TournamentGroup,
		"Group B": find_child("Group B") as TournamentGroup,
		"Group C": find_child("Group C") as TournamentGroup,
		"Group D": find_child("Group D") as TournamentGroup
	}
	
func update():
	var sorted_groups = tournament.get_ref().get_sorted_groups()
	groups["Group A"].group = sorted_groups[0]
	groups["Group A"].update()
	groups["Group B"].group = sorted_groups[1]
	groups["Group B"].update()
	groups["Group C"].group = sorted_groups[2]
	groups["Group C"].update()
	groups["Group D"].group = sorted_groups[3]
	groups["Group D"].update()
	
