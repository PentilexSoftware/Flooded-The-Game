
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

var vp
var tile_map
var cam
var dead_texture
var dead = false


func _ready():
	# Initialization here
	vp = get_viewport()
	tile_map = get_node("../TileMap")
	cam = get_node("Camera2D")
	dead_texture = ImageTexture.new()
	dead_texture.load("res://tiles/gopher_dead.png")
	set_process(true)
	pass
	 
func dig(pos):
	pos = tile_map.world_to_map(pos)
	if((tile_map.get_cell(pos.x, pos.y) == 0) or (tile_map.get_cell(pos.x, pos.y) > 1)):
		tile_map.set_cell(pos.x, pos.y, -1)


func dead():
	get_node("./Sprite").set_texture(dead_texture)
	dead = true

func is_passable(pos, delta):
	var output
	
	pos = tile_map.world_to_map(pos)
	if((tile_map.get_cell(pos.x, pos.y) == 0) or (tile_map.get_cell(pos.x, pos.y) > 1)):
		dig(tile_map.map_to_world(pos))
		output = true
	elif(tile_map.get_cell(pos.x, pos.y) == 1):
		dead()
		output = true
	elif(tile_map.get_cell(pos.x, pos.y) == -1):
		output = true
	
	return output

func _process(delta):
	var cur_pos = get_pos()
	var cur_rot = get_rot()

	if((Input.is_action_pressed("ui_up") or Input.is_mouse_button_pressed(BUTTON_LEFT)) and is_passable(cur_pos, delta) and !dead == true):
		move_local_y(128 * delta)
	if((Input.is_action_pressed("ui_accept") or Input.is_mouse_button_pressed(BUTTON_RIGHT)) == true):
		dig(cur_pos)
	
	look_at(cam.get_global_mouse_pos())

