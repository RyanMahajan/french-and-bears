extends Node2D
class_name BearAI

var bear_array: Array[Bear]
var terrain_array: Array[Array]

func _ready():
	var explore_timer = Timer.new()
	explore_timer.wait_time = 1.0
	explore_timer.autostart = true
	add_child(explore_timer)
	explore_timer.connect("timeout", Callable(self, "_on_bear_ai_timer_timeout"))

func _process(delta: float) -> void:
	pass

func set_arrays(bears: Array[Bear], terrains: Array[Array]):
	bear_array = bears
	terrain_array = terrains

func _on_bear_ai_timer_timeout():
	for bear in bear_array:
		var surroundings: Array[Terrain] = get_surrounding_terrain(bear)
		var clan_terrain_count: int = 0
		var enemy_terrain: Terrain
		for terrain in surroundings:
			if terrain:
				if terrain.terrain_crystal == -1:
					bear.target_dir == terrain.position
					return
				elif terrain.terrain_crystal == bear.bear_type:
					clan_terrain_count+=1
				else:
					enemy_terrain = terrain
		if clan_terrain_count > 5 and enemy_terrain:
			bear.target_dir = enemy_terrain.position
		else:
			var target = surroundings.pick_random()
			while not target:
				target = surroundings.pick_random()
			bear.target_dir = target.position

func get_surrounding_terrain(bear: Bear) -> Array[Terrain]:
	var padded_array = pad_array(terrain_array)
	var bear_index = get_terrain_index(bear, padded_array)
	var surroundings: Array[Terrain]
	surroundings.append(padded_array[bear_index.x-1][bear_index.y-1])
	surroundings.append(padded_array[bear_index.x][bear_index.y-1])
	surroundings.append(padded_array[bear_index.x+1][bear_index.y-1])
	
	surroundings.append(padded_array[bear_index.x-1][bear_index.y])
	surroundings.append(padded_array[bear_index.x+1][bear_index.y])
	
	surroundings.append(padded_array[bear_index.x-1][bear_index.y+1])
	surroundings.append(padded_array[bear_index.x][bear_index.y+1])
	surroundings.append(padded_array[bear_index.x+1][bear_index.y+1])
	return surroundings

func get_terrain_index(bear: Bear, arr:Array[Array]) -> Vector2i:
	for i in range(0, arr.size()):
		for j in range(0, arr[0].size()):
			if bear.curr_terrain == arr[i][j]:
				return Vector2i(i, j)
	return Vector2i(-1, -1)

func pad_array(arr: Array[Array]) -> Array[Array]:
	var padded_array: Array[Array]
	var row = []
	for i in range(0, arr[0].size()+2):
		row.append(null)
	padded_array.append(row)
	for arr_row in arr:
		row = []
		row.append(null)
		row.append_array(arr_row)
		row.append(null)
		padded_array.append(row)
	row = []
	for i in range(0, arr[0].size()+2):
		row.append(null)
	padded_array.append(row)
	return padded_array
