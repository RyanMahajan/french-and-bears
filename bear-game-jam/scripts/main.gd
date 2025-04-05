extends Node2D

@export var terrain_generator: TerrainGenerator
@export var bear_spawner: BearSpawner

var terrain_array: Array[Array]
var spawn_crystals: Array[int]

var bear_array: Array[Array]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	terrain_generator.set_spawn_crystals(spawn_crystals)
	terrain_generator.set_terrain_top(terrain_array, spawn_crystals)
	terrain_generator.set_terrain_bottom(terrain_array, spawn_crystals)
	terrain_generator.add_to_scene(terrain_array)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
