extends Panel

class_name AnimatedMenu

@export var animator: AnimationPlayer

func open_menu():
	animator.play("Open %s" % name)
	
func close_menu():
	animator.play("Close %s" % name)
