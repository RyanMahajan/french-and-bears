extends Node2D

@export var terrains: Array[terrain_res]
@export var null_terrain: terrain_res

var terrain_array: Array[Array]
var spawn_crystals: Array[int]
var spawn_rings: int = 10

func set_spawn_crystals():
	for i in range(0, terrains.size()):
		spawn_crystals.append(i)
	spawn_crystals.shuffle()

func set_terrain_top():
	for i in range(0, spawn_rings):
		var spawn_row: Array[Terrain] = []
		for j in range(0, spawn_rings*2):
			if j < spawn_rings-i:
				spawn_row.append(new_terrain(terrains[spawn_crystals[0]]))
			elif j > spawn_rings+i-1:
				spawn_row.append(new_terrain(terrains[spawn_crystals[1]]))
			else:
				spawn_row.append(new_terrain(null_terrain))
		terrain_array.append(spawn_row)

func set_terrain_bottom():
	for i in range(0, spawn_rings):
		var spawn_row: Array[Terrain] = []
		for j in range(0, spawn_rings*2):
			if j < i+1:
				spawn_row.append(new_terrain(terrains[spawn_crystals[2]]))
			elif j > spawn_rings*2-2-i:
				spawn_row.append(new_terrain(terrains[spawn_crystals[3]]))
			else:
				spawn_row.append(new_terrain(null_terrain))
		terrain_array.append(spawn_row)

func new_terrain(res: terrain_res) -> Terrain:
	var ter = Terrain.new()
	ter.background_res = res
	return ter

func add_to_scene():
	for i in range(0, terrain_array.size()):
		for j in range(0, spawn_rings*2):
			terrain_array[i][j].position = Vector2(500*i, 500*j)
			add_child(terrain_array[i][j])

func _ready() -> void:
	set_spawn_crystals()
	set_terrain_top()
	set_terrain_bottom()
	add_to_scene()
