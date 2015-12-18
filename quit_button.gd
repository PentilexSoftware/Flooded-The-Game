
extends Button

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initialization here
	pass

func _on_Button_pressed():
	
	if(not (get_tree().get_current_scene().get_path() == "res://Scenes/start_menu.scn")):
		get_tree().change_scene("res://Scenes/start_menu.scn")
	else:
		get_tree().quit()
	pass



func _on_Button_pressed_on_start_menu():
	get_tree().quit()
	pass
