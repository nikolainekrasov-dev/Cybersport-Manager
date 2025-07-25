extends Control

class_name ScreenManager

var screens = {}
var active_screen = null
var screen_seq = []

func _ready():
	for screen in get_children():
		if not(screen.name.ends_with("Animator")):
			screens[screen.name] = screen
	active_screen = screens["Main Menu"]
	
func show_screen(screen_name):
	screen_seq.append(active_screen)
	active_screen.visible = false
	active_screen = screens[screen_name]
	active_screen.visible = true
	
func show_prev_screen():
	active_screen.refresh()
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
	screens["Home"].update()
	show_screen("Home")
	
func show_teams():
	screens["Teams"].update()
	show_screen("Teams")
	
func show_players():
	screens["Players"].update()
	show_screen("Players")
	
func show_matches():
	screens["Matches"].update()
	show_screen("Matches")
	
func show_tournaments():
	show_screen("Tournaments")
	
func show_team(team):
	if team != null and team.get_ref() != null:
		screens["Team"].update(team)
		show_screen("Team")
	
func show_heroes():
	screens["Heroes"].update()
	show_screen("Heroes")
	
func show_calendar():
	screens["Calendar"].update()
	show_screen("Calendar")
	
func show_hero(hero):
	if hero != null and hero.get_ref() != null:
		screens["Hero"].update(hero)
		show_screen("Hero")
	
func show_player(player):
	if player != null and player.get_ref() != null:
		screens["Player"].update(player)
		show_screen("Player")
	
func refresh_all_screens():
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
