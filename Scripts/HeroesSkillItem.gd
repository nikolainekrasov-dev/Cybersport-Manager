extends LabeledTextureButton

class_name HeroesSkillItem

@export var first_hero_portrait: TextureButton
@export var second_hero_portrait: TextureButton
@export var first_hero_name: Label
@export var second_hero_name: Label
@export var first_hero_skill: Label
@export var second_hero_skill: Label
@export var first_hero_progress: TextureProgressBar
@export var second_hero_progress: TextureProgressBar
@onready var screen_manager: ScreenManager = get_node("/root/Screen manager")
@onready var player_screen: HeroScreenController = get_node("/root/Screen manager/Hero") as HeroScreenController

var first_hero_info: WeakRef
var second_hero_info: WeakRef

func _ready():
	first_hero_portrait.connect("pressed", Callable(self, "show_first_hero"))
	second_hero_portrait.connect("pressed", Callable(self, "show_second_hero"))

func set_heroes(player, first_hero, second_hero):
	if player != null and player.get_ref() != null:
		player = player.get_ref()
		first_hero_info = first_hero
		second_hero_info = second_hero
		first_hero_portrait.texture_normal = first_hero.get_ref().mini_portrait
		second_hero_portrait.texture_normal = second_hero.get_ref().mini_portrait
		first_hero_name.text = first_hero.get_ref().name
		second_hero_name.text = second_hero.get_ref().name
		first_hero_skill.text = str(player.heroes_skill[first_hero.get_ref()])
		second_hero_skill.text = str(player.heroes_skill[second_hero.get_ref()])
		first_hero_progress.value = player.heroes_skill[first_hero.get_ref()]
		second_hero_progress.value = player.heroes_skill[second_hero.get_ref()]

func show_first_hero():
	screen_manager.show_hero(first_hero_info)
	
func show_second_hero():
	screen_manager.show_hero(second_hero_info)
