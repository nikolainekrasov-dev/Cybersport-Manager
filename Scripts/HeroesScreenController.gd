extends CanvasLayer

class_name HeroesScreenController

var hero_info_icon_prefab = preload("res://Prefabs/Hero Info Icon.tscn")
@onready var screen_manager = get_node("/root/Screen manager") as ScreenManager
@export var strength_heroes_table: Panel
@export var agility_heroes_table: Panel
@export var intelligence_heroes_table: Panel

func fix_heroes_icon_count():
	for i in range(len(strength_heroes_table.get_children()), len(HeroesManager.strength_heroes)):
		var new_hero_info_icon = hero_info_icon_prefab.instantiate() as HeroInfoButton
		strength_heroes_table.add_child(new_hero_info_icon)
		new_hero_info_icon.position = Vector2(119 * (i % 4), 87 * (i / 4))
	
	for i in range(len(agility_heroes_table.get_children()), len(HeroesManager.agility_heroes)):
		var new_hero_info_icon = hero_info_icon_prefab.instantiate() as HeroInfoButton
		agility_heroes_table.add_child(new_hero_info_icon)
		new_hero_info_icon.position = Vector2(119 * (i % 4), 87 * (i / 4))
		
	for i in range(len(intelligence_heroes_table.get_children()), len(HeroesManager.intelligence_heroes)):
		var new_hero_info_icon = hero_info_icon_prefab.instantiate() as HeroInfoButton
		intelligence_heroes_table.add_child(new_hero_info_icon)
		new_hero_info_icon.position = Vector2(119 * (i % 4), 87 * (i / 4))
	
func update():
	pass
	
func refresh():
	pass

func update_heroes_table():
	fix_heroes_icon_count()
	var strength_heroes_icons = strength_heroes_table.get_children()
	for i in range(len(HeroesManager.strength_heroes)):
		strength_heroes_icons[i].set_hero(weakref(HeroesManager.strength_heroes[i]))
	var agility_heroes_icons = agility_heroes_table.get_children()
	for i in range(len(HeroesManager.agility_heroes)):
		agility_heroes_icons[i].set_hero(weakref(HeroesManager.agility_heroes[i]))
	var intelligence_heroes_icons = intelligence_heroes_table.get_children()
	for i in range(len(HeroesManager.intelligence_heroes)):
		intelligence_heroes_icons[i].set_hero(weakref(HeroesManager.intelligence_heroes[i]))
		
