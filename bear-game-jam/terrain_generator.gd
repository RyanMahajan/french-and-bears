extends Node2D

@export var terrains: Array[terrain_res]
@export var null_terrain: Terrain = null

var terrain_array: Array[Terrain]
var spawn_crystals: Array[Terrain]
var spawn_rings: int = 5

func set_spawn_crystals():
	for terrain in terrains:
		var ter = Terrain.new()
		ter.background_res = terrain
		spawn_crystals.append(ter)

func set_terrain_top():
	for i in range(0, spawn_rings):
		var spawn_row: Array[Terrain] = []
		for j in range(0, spawn_rings*2):
			if j < spawn_rings-i:
				spawn_row.append(spawn_crystals[0].duplicate())
			elif j > spawn_rings+i-1:
				spawn_row.append(spawn_crystals[1].duplicate())
			else:
				spawn_row.append(null_terrain)
		terrain_array.append(spawn_row.duplicate(true))
		print("spawn_row: ", spawn_row)

func set_terrain_bottom():
	var spawn_row = []
	for i in range(0, spawn_rings):
		for j in range(0, spawn_rings*2):
			if j < i:
				spawn_row.append(spawn_crystals[2].duplicate())
			elif j > spawn_rings*2-i:
				spawn_row.append(spawn_crystals[3].duplicate())
			else:
				spawn_row.append(null_terrain.duplicate())
		terrain_array.append(spawn_row)
		spawn_row.clear()

func new_terrain(res: terrain_res) -> Terrain:
	var ter = Terrain.new()
	ter.background_res = res
	return ter

func _ready() -> void:
	set_spawn_crystals()
	set_terrain_top()
	#set_terrain_bottom()
	print(terrain_array)
