extends CanvasLayer

class_name HeroScreenController

var hero_portrait: TextureRect
var hero_name: Label
var hero_role: Label
var attack_type: Label
var hero_story: Label
var hero_strength: Label
var hero_agility: Label
var hero_intelligence: Label
var health: Label
var hp_regen: Label
var armor: Label
var magic_res: Label
var attack: Label
var attack_interval: Label
var attack_range: Label
var crit_chance: Label
var crit: Label
var ability_power: Label
var move_speed: Label
var first_ability: TextureRect
var second_ability: TextureRect
var third_ability: TextureRect
var fourth_ability: TextureRect
var hero: WeakRef

func _ready():
	hero_portrait = find_child("Hero Portrait")
	hero_name = find_child("Hero Name")
	hero_role = find_child("Role")
	hero_story = find_child("Hero Story")
	hero_strength = find_child("Strength")
	hero_agility = find_child("Agility")
	hero_intelligence = find_child("Intelligence")
	health = find_child("Health")
	attack_type = find_child("Attack Type")
	hp_regen = find_child("HP Regen")
	armor = find_child("Armor")
	magic_res = find_child("Magic Res")
	attack = find_child("Attack")
	attack_interval = find_child("Attack Interval")
	attack_range = find_child("Attack Range")
	move_speed = find_child("Move Speed")
	first_ability = find_child("First Ability")
	second_ability = find_child("Second Ability")
	third_ability = find_child("Third Ability")
	fourth_ability = find_child("Fourth Ability")
	
func update():
	if hero != null and hero.get_ref() != null:
		var hero_instance = hero.get_ref()
		hero_portrait.texture = hero_instance.portrait
		hero_name.text = hero_instance.name
		hero_role.text = hero_instance.role
		attack_type.text = hero_instance.attack_type
		hero_strength.text = str(hero_instance.base_strength)
		hero_agility.text = str(hero_instance.base_agility)
		hero_intelligence.text = str(hero_instance.base_intelligence)
		health.text = str(hero_instance.calc_health())
		hp_regen.text = "+%s" % str(hero_instance.base_health_reg)
		armor.text = str(hero_instance.base_armor)
		magic_res.text = str(hero_instance.base_magic_res)
		attack.text = str(hero_instance.base_attack_damage)
		attack_interval.text = str(hero_instance.calc_base_attack_interval())
		attack_range.text = str(hero_instance.base_attack_range)
		move_speed.text = str(hero_instance.base_move_speed)
		first_ability.texture = hero_instance.first_ability_icon
		second_ability.texture = hero_instance.second_ability_icon
		third_ability.texture = hero_instance.third_ability_icon
		fourth_ability.texture = hero_instance.fourth_ability_icon

func refresh():
	pass
