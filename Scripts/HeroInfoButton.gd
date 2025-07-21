extends TextureButton

class_name HeroInfoButton

var hero: WeakRef
@onready var screen_manager = get_node("/root/Screen manager")

func _ready():
	connect("pressed", Callable(self, "change_hero_screen"))

func change_hero_screen():
	screen_manager.show_hero(hero)

func set_hero(new_hero):
	hero = new_hero
	texture_normal = hero.get_ref().mini_portrait
	
