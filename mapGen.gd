
extends TileMap

# member variables here, example:
# var a=2
# var b="textvar"

var accum = 0


func _ready():
	# Initialization here
	print(get_used_cells())
	set_process(true)
	pass

func get_water_cells():
	var used_cells = get_used_cells()
	
	for i in used_cells:
		if(get_cell(i.x, i.y) != 1):
			used_cells.remove(used_cells.find(i))
	
	return used_cells



func flood_empty_tile(cur_pos, rel_x, rel_y):
	var empty_cell = Vector2(cur_pos.x + rel_x, cur_pos.y + rel_y)
	if(get_cell(empty_cell.x, empty_cell.y) == -1):
			set_cell(empty_cell.x, empty_cell.y, 1)

func _process(delta):

	accum += delta
	if(accum > 1.5):
		accum = 0
		#var water_cells = get_water_cells()
		
		for i in get_water_cells():
			
			flood_empty_tile(i, 1, 0)
			flood_empty_tile(i, -1, 0)
			flood_empty_tile(i, 0, 1)
			flood_empty_tile(i, 0, -1)
			