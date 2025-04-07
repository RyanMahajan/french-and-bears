# Chunk.gd
extends Node2D
class_name Chunk

const CHUNK_SIZE := 64  # tiles per chunk
const TILE_SIZE := 1  # pixels per tile

@export var zone_generator: ZoneGenerator

var chunk_pos: Vector2i

func _ready():
	queue_redraw()

func _draw():
	for x in CHUNK_SIZE:
		for y in CHUNK_SIZE:
			var world_x = chunk_pos.x * CHUNK_SIZE + x
			var world_y = chunk_pos.y * CHUNK_SIZE + y
			var zone_id = zone_generator.get_zone_id(world_x, world_y)
			var color = get_zone_color(zone_id)
			draw_rect(Rect2(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE, TILE_SIZE), color, true)

func get_zone_color(zone_id: int) -> Color:
	var colors = [
		Color.hex(0xFFB347),
		Color.hex(0x77DD77),
		Color.hex(0xAEC6CF),
		Color.hex(0xFF6961),
		Color.hex(0xCBAACB),
		Color.hex(0xFDFD96)
	]
	return colors[zone_id % colors.size()]
