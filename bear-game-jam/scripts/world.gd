# World.gd
extends Node2D

@onready var zone_generator = ZoneGenerator.new()
const CHUNK_SCENE = preload("res://scenes/chunk.tscn")

const VIEW_RADIUS := 2  # in chunks
var loaded_chunks := {}

func _ready():
	add_child(zone_generator)
	update_visible_chunks(Vector2.ZERO)

func update_visible_chunks(player_chunk_pos: Vector2i):
	for x in range(-VIEW_RADIUS, VIEW_RADIUS + 1):
		for y in range(-VIEW_RADIUS, VIEW_RADIUS + 1):
			var chunk_coords = player_chunk_pos + Vector2i(x, y)
			if not loaded_chunks.has(chunk_coords):
				load_chunk(chunk_coords)

func load_chunk(chunk_coords: Vector2i):
	var chunk = CHUNK_SCENE.instantiate()
	chunk.position = chunk_coords * chunk.CHUNK_SIZE * chunk.TILE_SIZE
	chunk.chunk_pos = chunk_coords
	chunk.zone_generator = zone_generator
	add_child(chunk)
	loaded_chunks[chunk_coords] = chunk
