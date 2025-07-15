class_name HeroInfo

static var health_for_strength_point = 10

var name: String
var role: String
var attack_type: String
var story: String
var main_attribute: String
var portrait: Texture2D
var mini_portrait: Texture2D
var first_ability_icon: Texture2D
var second_ability_icon: Texture2D
var third_ability_icon: Texture2D
var fourth_ability_icon: Texture2D


var base_strength: int
var base_agility: int
var base_intelligence: int
var base_strength_gain_per_level: float
var base_agility_gain_per_level: float
var base_intelligence_gain_per_level: float
var base_health: int
var base_health_reg: float
var base_armor: int
var base_magic_res: int
var base_attack_damage: int
var base_attack_speed: int
var base_movement_speed: int
var base_attack_range: int
var base_move_speed: int


func _init(hero_name, hero_main_attribute, hero_role, hero_attack_type):
	name = hero_name
	main_attribute = hero_main_attribute
	role = hero_role
	attack_type = hero_attack_type
	portrait = load("res://Heroes/%s/portrait.png" % name)
	first_ability_icon = load("res://Heroes/%s/first_ability_icon.png" % name)
	second_ability_icon = load("res://Heroes/%s/second_ability_icon.png" % name)
	third_ability_icon = load("res://Heroes/%s/third_ability_icon.png" % name)
	fourth_ability_icon = load("res://Heroes/%s/fourth_ability_icon.png" % name)
	mini_portrait = load("res://Heroes/%s/mini_portrait.png" % name)

func calc_health():
	return base_health + health_for_strength_point * base_strength
	
func calc_base_attack_interval():
	return 150.0 / base_attack_speed
