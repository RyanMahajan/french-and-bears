extends CharacterBody2D

@export var sprite: Sprite2D

const SPEED = 300.0


func _physics_process(delta: float) -> void:
	var direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()
	velocity = direction * SPEED
	
	sprite.rotation = direction.angle()

	move_and_slide()
