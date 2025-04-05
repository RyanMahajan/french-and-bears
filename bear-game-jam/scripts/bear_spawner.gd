extends Node2D
class_name BearSpawner

@export var bear_clan_size: int = 20
@export var spawn_rings: int = 10

func set_bear_top(bear_array: Array[Array], spawn_crystals: Array[int]):
	for i in range(0, spawn_rings):
		var spawn_row: Array[Terrain] = []
		for j in range(0, spawn_rings*2):
			if j < spawn_rings-i:
				spawn_row.append(new_bear(spawn_crystals[0]))
			elif j > spawn_rings+i-1:
				spawn_row.append(new_bear(spawn_crystals[1]))
			else:
				pass
		bear_array.append(spawn_row)

func set_bear_bottom():
	pass

func new_bear(res: int) -> Bear:
	var ter = Bear.new()
	ter.background_res = res
	return ter

func _ready() -> void:
	pass
