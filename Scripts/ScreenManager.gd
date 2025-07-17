extends Control

class_name ScreenManager

var screens = {}
var active_screen = null
var screen_seq = []

func _ready():
	for screen in get_children():
		screens[screen.name] = screen
	active_screen = screens["Main menu"]
	
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
	show_screen("Main menu")
	
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
	
func show_team():
	show_screen("Team")
	
func show_heroes():
	show_screen("Heroes")
	
func show_hero():
	show_screen("Hero")
	
func show_player():
	show_screen("Player")
	
func exit_game():
	active_screen = null
	screen_seq.clear()
	for screen in screens:
		if screens[screen] != null:
			screens[screen].queue_free()
	screens.clear()
	get_tree().quit()
