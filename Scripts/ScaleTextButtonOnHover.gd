extends Button

class_name ScaleTextButtonOnHover

@export var default_size: float
@export var scaled_size: float

func _ready():
	connect("mouse_entered", Callable(self, "set_scaled_text_size"))
	connect("mouse_exited", Callable(self, "set_default_text_size"))
	
func set_default_text_size():
	add_theme_font_size_override("font_size", default_size)
	
func set_scaled_text_size():
	add_theme_font_size_override("font_size", scaled_size)
