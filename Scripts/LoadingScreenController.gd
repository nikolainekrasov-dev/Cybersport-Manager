extends CanvasLayer

class_name LoadingScreenController

var thread = Thread.new()
static var advice = ["First advice", "Second advice", "Third advice"]
var advice_index = 0
var task: Callable
var advice_timer: Timer
var progress_bar_timer: Timer
@export var animator: AnimationPlayer
@export var screen_manager: ScreenManager
var progress_bar: ProgressBar
var team_logo: TextureRect
var advice_label: Label

func _ready():
	progress_bar = find_child("Progress Bar")
	advice_label = find_child("Advice")
	advice_timer = Timer.new()
	advice_timer.wait_time = 3
	advice_timer.one_shot = false
	advice_timer.timeout.connect(change_advice)
	add_child(advice_timer)
	progress_bar_timer = Timer.new()
	progress_bar_timer.wait_time = 0.8
	progress_bar_timer.one_shot = false
	progress_bar_timer.timeout.connect(update_progress_bar)
	add_child(progress_bar_timer)
	team_logo = find_child("Team Logo")

func change_advice():
	advice_index = (advice_index + 1) % len(advice)
	advice_label.text = advice[advice_index]

func load_new_game(team):
	TeamsManager.set_player_team(team)
	progress_bar.value = 0
	advice_index = 0
	advice_label.text = advice[0]
	advice_timer.start()
	progress_bar_timer.start()
	team_logo.texture = team.white_logo
	animator.play("Pulse Team Logo")
	thread.start(Callable(self, "test").bind(team))
	Callable(screen_manager, "show_loading").call()

func update_progress_bar():
	progress_bar.value += 6 + randi() % 6

func test(team):
	Callable(GameLifecycleService, "start_new_game").bind(team).call()
	call_deferred("move_to_home_screen")
	
func move_to_home_screen():
	Callable(screen_manager, "show_home").call()
	thread.wait_to_finish()
