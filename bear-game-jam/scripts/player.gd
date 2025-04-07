extends Bear
class_name Player

@export var world: Node2D

var current_chunk := Vector2i.ZERO

func _process(_delta):
	var new_chunk = Vector2i(
		floor(position.x / (Chunk.CHUNK_SIZE * Chunk.TILE_SIZE)),
		floor(position.y / (Chunk.CHUNK_SIZE * Chunk.TILE_SIZE))
	)

	if new_chunk != current_chunk:
		current_chunk = new_chunk
		world.update_visible_chunks(current_chunk)


func _physics_process(delta: float) -> void:
	SPEED = 300.0
	var direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()
	velocity = direction * SPEED
	
	if direction != Vector2.ZERO:
		last_move_direction = direction

	rotation = lerp_angle(rotation, last_move_direction.angle() + PI / 2, 0.1)
	update_animation(direction)

	move_and_slide()
