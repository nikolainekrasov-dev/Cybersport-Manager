extends Panel

class_name MatchHistoryPanel

@export var last_matches: Array[MatchMenuItem]

func update(player):
	visible = true
	var player_matches = Match.get_matches_for_player(player)
	for i in range(len(last_matches)):
		if i < len(player_matches):
			last_matches[i].visible = true
			last_matches[i].update(player_matches[i])
		else:
			last_matches[i].visible = false
	
func refresh():
	visible = false
