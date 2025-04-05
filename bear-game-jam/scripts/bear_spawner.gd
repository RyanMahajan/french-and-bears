extends Node2D
class_name BearSpawner

var BearScene = preload("res://scenes/bear.tscn")

@export var bear_clan_size: int = 50
@export var spawn_rings: int = 10

func set_bear_top(bear_array: Array[Bear], spawn_crystals: Array[int]):
	var spawn_rate: int = bear_clan_size/spawn_rings
	for i in range(0, bear_clan_size/spawn_rate):
		for j in range(0, spawn_rate):
			var bear = new_bear(spawn_crystals[0])
			var bear_spawns = get_bear_spawns(i+1)
			bear.position = bear_spawns.pick_random()
			bear_array.append(bear)

func set_bear_bottom():
	pass

func new_bear(type: Bear.SPECIES) -> Bear:
	var bear = BearScene.instantiate()
	bear.bear_type = type
	return bear

func get_bear_spawns(index: int) -> Array[Vector2]:
	var ring: Array[Vector2] = []
	for i in range(0, index):
		ring.append(Vector2(i*250+250, index*250-i*250))
	return ring

func add_to_scene(bear_array: Array[Bear]):
	for bear in bear_array:
		add_child(bear)

func _ready() -> void:
	pass
