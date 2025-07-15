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
	
func set_heroes(player, first_hero, second_hero):
	first_hero_portrait.texture_normal = first_hero.mini_portrait
	second_hero_portrait.texture_normal = second_hero.mini_portrait
	first_hero_name.text = first_hero.name
	second_hero_name.text = second_hero.name
	first_hero_skill.text = str(player.heroes_skill[first_hero])
	second_hero_skill.text = str(player.heroes_skill[second_hero])
	first_hero_progress.value = player.heroes_skill[first_hero]
	second_hero_progress.value = player.heroes_skill[second_hero]
