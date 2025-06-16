extends Control

class_name ScreenManager

var screens = {}
var active_screen: CanvasLayer
var prev_screen: CanvasLayer = null


func _ready():
	for screen in get_children():
		screens[screen.name] = screen
	active_screen = screens["Main menu"]
	
func show_screen(screen_name):
	prev_screen = active_screen
	active_screen.visible = false
	active_screen = screens[screen_name]
	active_screen.visible = true
	
func show_prev_screen():
	show_screen(prev_screen.name)

func show_main_menu():
	show_screen("Main menu")
	
func show_team_selection():
	show_screen("Team Selection")
	
func show_home():
	show_screen("Home")
	
func exit_game():
	get_tree().quit()
