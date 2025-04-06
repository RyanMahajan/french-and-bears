extends Node2D
class_name BearSpawner

var BearScene = preload("res://scenes/bear.tscn")

@export var bear_clan_size: int = 30
@export var spawn_rings: int = 10

func set_bear_clan(bear_array: Array[Bear], spawn_crystals: Array[int], crystal: int):
	var spawn_rate: int = bear_clan_size/spawn_rings
	for i in range(spawn_rate, spawn_rings):
		for j in range(0, spawn_rate):
			var bear = new_bear(spawn_crystals[crystal])
			var bear_spawns = get_bear_spawns(i+1, crystal)
			bear.position = bear_spawns.pick_random()
			bear_array.append(bear)

func new_bear(type: Bear.SPECIES) -> Bear:
	var bear = BearScene.instantiate()
	bear.bear_type = type
	return bear

func get_bear_spawns(index: int, spawn_crystal: int) -> Array[Vector2]:
	var ring: Array[Vector2] = []
	for i in range(0, index):
		if spawn_crystal == 0: #(0,0)
			ring.append(Vector2(i*250+250, index*250-i*250))
		elif spawn_crystal == 1: #(1,2)
			ring.append(Vector2(i*250+250, (spawn_rings*4-1)*250-(index*250)+(i*250)))
		elif spawn_crystal == 2: #(2,1)
			ring.append(Vector2((spawn_rings*4-1)*250-(index*250)+(i*250), i*250+250))
		elif spawn_crystal == 3: #(3,3ds)
			ring.append(Vector2((spawn_rings*4-1)*250-(index*250)+(i*250), (spawn_rings*4-1)*250-(i*250)))
	return ring

func add_to_scene(bear_array: Array[Bear]):
	for bear in bear_array:
		add_child(bear)

func _ready() -> void:
	pass
