extends Node

class_name HeroesScreenController

var hero_info_icon_prefab = preload("res://Prefabs/Hero Info Icon.tscn")
@export var strength_heroes_table: Panel
@export var agility_heroes_table: Panel
@export var intelligence_heroes_table: Panel

func _ready():
	var strength_count: int = 0
	var agility_count: int = 0
	var intelligence_count: int = 0
	for hero_info in HeroesManager.heroes:
		var new_hero_info_icon = hero_info_icon_prefab.instantiate() as HeroInfoButton
		new_hero_info_icon.set_hero(hero_info)
		new_hero_info_icon.connect("pressed", Callable(get_node("/root/Screen manager"), "show_hero"))
		if hero_info.main_attribute == "Strength":
			strength_heroes_table.add_child(new_hero_info_icon)
			new_hero_info_icon.position = Vector2(119 * (strength_count % 4), 87 * (strength_count / 4))
			strength_count += 1
		elif hero_info.main_attribute == "Agility":
			agility_heroes_table.add_child(new_hero_info_icon)
			new_hero_info_icon.position = Vector2(119 * (agility_count % 4), 87 * (agility_count / 4))
			agility_count += 1
		else:
			intelligence_heroes_table.add_child(new_hero_info_icon)
			new_hero_info_icon.position = Vector2(119 * (intelligence_count % 4), 87 * (intelligence_count / 4))
			intelligence_count += 1
