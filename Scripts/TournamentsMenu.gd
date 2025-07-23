extends Panel

class_name TournamentsMenu

static var wait_time = 20
var tournament_name: Label
var tournament_stage: Label
var tournament: WeakRef
var timer: Timer
var active_tournaments: Array
var tournament_index = 0
var tournaments_bodies = {}
var has_timer_started = false

func _ready():
	tournaments_bodies = {"Seeding Tournament Group Stage Body": find_child("Seeding Tournament Group Stage Body")}
	active_tournaments = []
	tournament_name = find_child("Name")
	tournament_stage = find_child("Stage")
	timer = Timer.new()
	timer.wait_time = wait_time
	timer.one_shot = false
	timer.timeout.connect(change_tournament)
	add_child(timer)
	
func update():
	active_tournaments = TournamentsManager.get_announced_tournaments()
	tournaments_bodies["Seeding Tournament Group Stage Body"].update()
	if not(has_timer_started):
		tournament_index = 0
		has_timer_started = true
		change_tournament()
		timer.start()
	
func refresh():
	tournaments_bodies["Seeding Tournament Group Stage Body"].tournament = null
	has_timer_started = false
	timer.stop()
	
func change_tournament():
	if len(active_tournaments) > 0:
		if tournament_index >= len(active_tournaments):
			tournament_index = 0
		tournament_index = tournament_index % len(active_tournaments)
		if active_tournaments[tournament_index].get_ref():
			tournament_name.text = active_tournaments[tournament_index].get_ref().name
			tournament_stage.text = active_tournaments[tournament_index].get_ref().get_current_stage()
			for tournament_body in tournaments_bodies:
				tournaments_bodies[tournament_body].visible = false
			tournaments_bodies["Seeding Tournament Group Stage Body"].visible = true
			tournaments_bodies["Seeding Tournament Group Stage Body"].tournament = active_tournaments[tournament_index]
			tournaments_bodies["Seeding Tournament Group Stage Body"].update()
		tournament_index += 1
