extends ScrollContainer

class_name MatchesTable

@export var container: VBoxContainer

static var matches_block_len = 30
var teams_to_display_count = 30
var match_menu_item = preload("res://Prefabs/Match Menu Item On Matches Screen.tscn")
var scroll_bar: ScrollBar
var matches_buttons = []

func _ready():
	scroll_bar = get_v_scroll_bar()
	scroll_bar.connect("value_changed", Callable(self, "on_menu_scrolled"))

func update():
	var matches = Match.matches.duplicate(false)
	matches.sort_custom(func(a, b): return a.date.is_greater(b.date))
	for i in range(len(matches_buttons), teams_to_display_count):
		if i < len(matches):
			var match_menu_item = match_menu_item.instantiate() as MatchMenuItem
			match_menu_item.update(weakref(matches[i]))
			container.add_child(match_menu_item)
			matches_buttons.append(match_menu_item)
	
func on_menu_scrolled(value):
	var max_value = scroll_bar.max_value
	if value > 0.7 * max_value and teams_to_display_count + matches_block_len < len(Match.matches):
		teams_to_display_count += matches_block_len
		update()
	
func refresh():
	for match_button in matches_buttons:
		match_button.queue_free()
	matches_buttons.clear()
	teams_to_display_count = 30
	scroll_bar.value = 0
