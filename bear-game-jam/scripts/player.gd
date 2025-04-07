extends Bear
class_name Player

func _physics_process(delta: float) -> void:
	SPEED = 300.0
	var direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()
	velocity = direction * SPEED
	
	if direction != Vector2.ZERO:
		last_move_direction = direction

	rotation = lerp_angle(rotation, last_move_direction.angle() + PI / 2, 0.1)
	update_animation(direction)

	move_and_slide()
