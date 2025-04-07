extends Node2D

@export var terrain_generator: TerrainGenerator
@export var bear_spawner: BearSpawner
@export var bear_ai: BearAI
@export var player: Player

var terrain_array: Array[Array]
var spawn_crystals: Array[int]

var bear_array: Array[Bear]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	terrain_generator.set_spawn_crystals(spawn_crystals)
	terrain_generator.set_terrain_top(terrain_array, spawn_crystals)
	terrain_generator.set_terrain_bottom(terrain_array, spawn_crystals)
	terrain_generator.add_to_scene(terrain_array)
	
	bear_spawner.set_bear_clan(bear_array, spawn_crystals, 0)
	bear_spawner.set_bear_clan(bear_array, spawn_crystals, 1)
	bear_spawner.set_bear_clan(bear_array, spawn_crystals, 2)
	bear_spawner.set_bear_clan(bear_array, spawn_crystals, 3)
	bear_spawner.add_to_scene(bear_array)
	
	bear_ai.set_arrays(bear_array, terrain_array)
	bear_ai.set_bear_terrains()
	bear_ai._on_bear_ai_timer_timeout()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
