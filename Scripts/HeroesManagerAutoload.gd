extends Node


class_name HeroesManagerAutoload

var heroes = []
var heroes_info_json = null
var gain_per_level_coef: float = 1.0 / 10.0
var base_health_coef: int = 10
var hp_regen_coef: float = 1.0 / 10.0
var attr_coefs = {
	"base_strength": 1,
	"base_agility": 1,
	"base_intelligence": 1,
	"base_strength_gain_per_level": 1.0 / 10.0,
	"base_agility_gain_per_level": 1.0 / 10.0,
	"base_intelligence_gain_per_level": 1.0 / 10.0,
	"base_health": 10,
	"base_health_reg": 1.0 / 10.0,
	"base_armor": 1,
	"base_magic_res": 1,
	"base_attack_damage": 1,
	"base_attack_speed": 1,
	"base_move_speed": 10,
	"base_attack_range": 1
}

func _ready():
	var heroes_info = FileAccess.open("res://Heroes//Heroes Generation Info.json", FileAccess.READ)
	var content = heroes_info.get_as_text()
	heroes_info_json = JSON.parse_string(content)
	for hero_name in heroes_info_json:
		var main_attribute = heroes_info_json[hero_name]["main_attribute"]
		var role = heroes_info_json[hero_name]["role"]
		var attack_type = heroes_info_json[hero_name]["attack_type"]
		var new_hero = HeroInfo.new(hero_name, main_attribute, role, attack_type)
		heroes.append(new_hero)
	
func setup_heroes_for_new_game():
	for hero in heroes:
		hero.base_strength = get_attribute(heroes_info_json[hero.name], "base_strength")
		hero.base_agility = get_attribute(heroes_info_json[hero.name], "base_agility")
		hero.base_intelligence = get_attribute(heroes_info_json[hero.name], "base_intelligence")
		hero.base_strength_gain_per_level = get_attribute(heroes_info_json[hero.name], "base_strength_gain_per_level")
		hero.base_agility_gain_per_level = get_attribute(heroes_info_json[hero.name], "base_agility_gain_per_level")
		hero.base_intelligence_gain_per_level = get_attribute(heroes_info_json[hero.name], "base_intelligence_gain_per_level")
		hero.base_health = get_attribute(heroes_info_json[hero.name], "base_health")
		hero.base_health_reg = get_attribute(heroes_info_json[hero.name], "base_health_reg")
		hero.base_armor = get_attribute(heroes_info_json[hero.name], "base_armor")
		hero.base_magic_res = get_attribute(heroes_info_json[hero.name], "base_magic_res")
		hero.base_attack_damage = get_attribute(heroes_info_json[hero.name], "base_attack_damage")
		hero.base_attack_speed = get_attribute(heroes_info_json[hero.name], "base_attack_speed")
		hero.base_move_speed = get_attribute(heroes_info_json[hero.name], "base_move_speed")
		hero.base_attack_range = get_attribute(heroes_info_json[hero.name], "base_attack_range")

func get_attribute(attrs, attr_name):
	var min_value_attr = int(attrs["min_%s" % attr_name])
	var max_value_attr = int(attrs["max_%s" % attr_name])
	return (min_value_attr + randi() % (max_value_attr - min_value_attr + 1)) * attr_coefs[attr_name]
