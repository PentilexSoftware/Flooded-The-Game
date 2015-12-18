
extends Button

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initialization here
	pass

func _on_Button_pressed():
	print(get_tree().get_current_scene())
	
	if(get_tree().get_current_scene() != "res://Scenes/start_menu.gd"):
		get_tree().change_scene("res://Scenes/start_menu.gd")
	else:
		get_tree().quit()
	pass

