extends Panel

class_name HeroesSkillPanel

var container: VBoxContainer
var heroes_skill_item = preload("res://Prefabs/Heroes Skill Item.tscn")

func _ready():
	container = find_child("ScrollContainer").find_child("VBoxContainer")
	
	
func fix_items_count():
	for i in range(len(container.get_children()), len(HeroesManager.heroes) / 2):
		var new_heroes_skill_item = heroes_skill_item.instantiate() as HeroesSkillItem
		container.add_child(new_heroes_skill_item)
	
func update(player):
	visible = true
	if player != null and player.get_ref() != null:
		fix_items_count()
		var heroes_skill_items = container.get_children()
		for i in range(len(heroes_skill_items)):
			heroes_skill_items[i].set_heroes(player, weakref(HeroesManager.heroes[i * 2]), weakref(HeroesManager.heroes[i * 2 + 1]))
			
func refresh():
	visible = false
	
