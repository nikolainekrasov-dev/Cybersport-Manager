extends TextureButton

class_name LabeledTextureButton

var labels = []
@export var default_text_color = Color("#636363")
@export var hover_text_color = Color.WHITE

func _ready():
	for child in get_children():
		if child is Label:
			labels.append(child)
	connect("mouse_entered", Callable(self, "set_hover_text_color"))
	connect("mouse_exited", Callable(self, "set_default_text_color"))
	connect("focus_exited", Callable(self, "set_default_text_color"))
			
func set_default_text_color():
	if not(has_focus()):
		for label in labels:
			label.add_theme_color_override("font_color", default_text_color)
		
func set_hover_text_color():
	for label in labels:
			label.add_theme_color_override("font_color", hover_text_color)
