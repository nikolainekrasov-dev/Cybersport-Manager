extends TextureButton

class_name HeroInfoButton

var hero: HeroInfo
@export var hero_screen: CanvasLayer

func _ready():
	connect("pressed", Callable(self, "change_hero_screen"))

func change_hero_screen():
	get_node("/root/Screen manager/Hero").set_hero(hero)

func set_hero(new_hero):
	hero = new_hero
	texture_normal = new_hero.mini_portrait
	texture_hover = new_hero.mini_portrait
	texture_focused = new_hero.mini_portrait
	texture_disabled = new_hero.mini_portrait
	texture_pressed = new_hero.mini_portrait
	
