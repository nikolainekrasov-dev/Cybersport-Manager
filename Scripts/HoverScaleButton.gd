extends TextureButton

class_name HoverScaleButton

@export var scale_size = 1.2

func _ready():
	connect("mouse_entered", Callable(self, "increase_button_size"))
	connect("mouse_exited", Callable(self, "decrease_button_size"))

func increase_button_size():
	scale = Vector2(scale_size, scale_size)
	
func decrease_button_size():
	scale = Vector2(1.0, 1.0)
