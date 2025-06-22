extends TextureButton

class_name SortButton

@export var default_texture: Texture2D
@export var pressed_texture: Texture2D
@export var sort_method: String
static var active_button: SortButton = null
var is_active: bool = false
var method_to_call: Callable

func _ready():
	connect("pressed", Callable(self, "press_button"))

func change_texture():
	if is_active:
		set_texture(default_texture)
	else:
		set_texture(pressed_texture)
		
func set_new_active_button():
	if active_button == null:
		active_button = self
	elif active_button == self and is_active:
		active_button.set_texture(active_button.default_texture)
		active_button = null
	else:
		active_button.is_active = false
		active_button.set_texture(active_button.default_texture)
		active_button = self
		
func set_texture(new_texture):
	texture_normal = new_texture
	texture_hover = new_texture
	texture_disabled = new_texture
	texture_pressed = new_texture
	texture_focused = new_texture
		
func press_button():
	change_texture()
	set_new_active_button()
	is_active = not(is_active)
	
func nullify():
	is_active = false
	active_button = null
	set_texture(default_texture)
