extends CanvasLayer

class_name PlayerScreenController

@export var player_photo: TextureRect
@export var player_rating: Label
@export var player_role: Label
@export var player_nick: Label
@export var player_name: Label
@export var player_surname: Label
@export var player_age: Label
@export var player_region: Label
@export var player_team: Label
@export var player_winnings: Label
@export var team_logo: TextureButton
@export var player_heroes_skill: HeroesSkillPanel
@export var player_match_history: MatchHistoryPanel
@export var right_panel_name: Label
@export var info_panels: Array[Panel]

var info_panel_index = 0
var player: WeakRef

func update(new_player):
	player = new_player
	player_photo.texture = player.get_ref().photo
	player_rating.text = str(player.get_ref().rating)
	player_nick.text = player.get_ref().nick
	player_name.text = player.get_ref().name
	player_surname.text = player.get_ref().surname
	player_region.text = player.get_ref().region
	player_age.text = str(player.get_ref().get_age())
	if player.get_ref().team != null and player.get_ref().team.get_ref() != null:
		player_team.text = player.get_ref().team.get_ref().name
		team_logo.texture_normal = player.get_ref().team.get_ref().logo
	player_winnings.text = "%d $" % player.get_ref().winnings
	
	if player.get_ref().role == "Carry":
		player_role.text = "CAR"
	elif player.get_ref().role == "Assassin":
		player_role.text = "ASN"
	elif player.get_ref().role == "Tank":
		player_role.text = "TNK"
	elif player.get_ref().role == "Pusher":
		player_role.text = "PUS"
	else:
		player_role.text = "SUP"
		
	show_current_panel()

func show_prev_info_panel():
	info_panels[info_panel_index].refresh()
	info_panel_index = (info_panel_index - 1) % len(info_panels)
	show_current_panel()
	
func show_next_info_panel():
	info_panels[info_panel_index].refresh()
	info_panel_index = (info_panel_index + 1) % len(info_panels)
	show_current_panel()
	
func show_current_panel():
	info_panels[info_panel_index].update(player)

func refresh():
	info_panel_index = 0
	for info_panel in info_panels:
		info_panel.refresh()
