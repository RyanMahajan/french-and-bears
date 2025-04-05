extends CharacterBody2D

@export var sprite: AnimatedSprite2D

var last_move_direction: Vector2 = Vector2.DOWN
const SPEED = 300.0

func _physics_process(delta: float) -> void:
	var direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()
	velocity = direction * SPEED
	
	if direction != Vector2.ZERO:
		last_move_direction = direction

	rotation = lerp_angle(rotation, last_move_direction.angle() + PI / 2, 0.1)
	update_animation(direction)

	move_and_slide()

func update_animation(dir: Vector2):
	if dir.length() > 0:
		if not sprite.is_playing() or sprite.animation != "walk":
			sprite.play("walk")
	else:
		if sprite.animation != "idle":
			sprite.play("idle")
