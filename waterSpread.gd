
extends Sprite

# member variables here, example:
# var a=2
# var b="textvar"
var tile_map
var accum = 0

func _ready():
	# Initialization here
	tile_map = get_node("../../TileMap")
	print("water init")
	set_process(true)
	
	pass

func flood_empty_tile(cur_pos, rel_x, rel_y):
	if(tile_map.get_cell(cur_pos.x + rel_x, cur_pos.y + rel_y) == -1):
			tile_map.set_cell(cur_pos.x + rel_x, cur_pos.y + rel_y, 1)

func _process(delta):
	accum += delta
	print(accum)
	if(accum > 1.5):
		accum = 0
		var cur_pos = tile_map.world_to_map(get_pos())
		
		print("Flooding")
		
		flood_empty_tile(cur_pos, 1, 0)
		flood_empty_tile(cur_pos, -1, 0)
		flood_empty_tile(cur_pos, 0, 1)
		flood_empty_tile(cur_pos, 0, -1)
