extends Control

class_name ScreenManager

var screens = {}
var active_screen = null
var screen_seq = []

func _ready():
	for screen in get_children():
		screens[screen.name] = screen
	#screens["Player"] = screens["Player"] as PlayerScreenController
	active_screen = screens["Main Menu"]
	
func show_screen(screen_name):
	screen_seq.append(active_screen)
	active_screen.visible = false
	active_screen = screens[screen_name]
	active_screen.visible = true
	active_screen.update()
	
func show_prev_screen():
	var screen_to_show = screen_seq.pop_back()
	active_screen.visible = false
	active_screen = screen_to_show
	active_screen.visible = true

func show_main_menu():
	show_screen("Main Menu")
	
func show_team_selection():
	show_screen("Team Selection")

func show_loading():
	show_screen("Loading")

func show_home():
	show_screen("Home")
	
func show_teams():
	show_screen("Teams")
	
func show_players():
	show_screen("Players")
	
func show_tournaments():
	show_screen("Tournaments")
	
func show_team(team):
	if team != null and team.get_ref() != null:
		screens["Team"].team = team
		show_screen("Team")
	
func show_heroes():
	show_screen("Heroes")
	
func show_hero(hero):
	if hero != null and hero.get_ref() != null:
		screens["Hero"].hero = hero
		show_screen("Hero")
	
func show_player(player):
	if player != null and player.get_ref() != null:
		screens["Player"].player = player
		show_screen("Player")
	
func refresh_all_teams():
	for screen in screens:
		screens[screen].refresh()
	
func exit_game():
	active_screen = null
	screen_seq.clear()
	for screen in screens:
		if screens[screen] != null:
			screens[screen].queue_free()
	screens.clear()
	get_tree().quit()
