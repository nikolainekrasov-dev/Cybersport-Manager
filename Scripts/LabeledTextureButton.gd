extends TextureButton

class_name LabeledTextureButton

@export var labels: Array[Label]
@export var colors: Array[Array]


func _ready():
	connect("mouse_entered", Callable(self, "set_hover_text_color"))
	connect("mouse_exited", Callable(self, "set_default_text_color"))
	connect("focus_exited", Callable(self, "set_default_text_color"))
			
func set_default_text_color():
	if not(has_focus()):
		for i in range(len(labels)):
			labels[i].add_theme_color_override("font_color", colors[i][0])
		
func set_hover_text_color():
	for i in range(len(labels)):
		labels[i].add_theme_color_override("font_color", colors[i][1])
