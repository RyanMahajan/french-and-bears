extends CharacterBody2D
class_name Bear

enum SPECIES {PANDA, BROWN, POLAR, BLACK}
enum STATE {IDLE, EXPLORE, DEFEND, ATTACK}

@export var bear_type: SPECIES
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var target_dir: Vector2
var curr_terrain: Terrain
var bear_state: STATE = STATE.IDLE

var last_move_direction: Vector2 = Vector2.DOWN
var SPEED = 200.0

func load_type():
	if bear_type == SPECIES.PANDA:
		sprite.frames = preload("res://resources/animations/panda_bear_anim.tres")
	elif bear_type == SPECIES.BLACK:
		sprite.frames = preload("res://resources/animations/black_bear_anim.tres")
	elif bear_type == SPECIES.BROWN:
		sprite.frames = preload("res://resources/animations/brown_bear_anim.tres")
	elif bear_type == SPECIES.POLAR:
		sprite.frames = preload("res://resources/animations/polar_bear_anim.tres")

func get_terrain_res() -> terrain_res:
	if bear_type == SPECIES.PANDA:
		return preload("res://resources/terrains/bamboo_terrain.tres")
	elif bear_type == SPECIES.BLACK:
		return preload("res://resources/terrains/rock_terrain.tres")
	elif bear_type == SPECIES.BROWN:
		return preload("res://resources/terrains/grass_terrain.tres")
	elif bear_type == SPECIES.POLAR:
		return preload("res://resources/terrains/ice_terrain.tres")
	return null

func load_collisions():
	if bear_type == SPECIES.PANDA:
		collision_layer = 1 << 2
		collision_mask = (1 << 3) | (1 << 4) | (1 << 5) | (1 << 1)
	elif bear_type == SPECIES.BLACK:
		collision_layer = 1 << 3
		collision_mask = (1 << 2) | (1 << 4) | (1 << 5) | (1 << 1)
	elif bear_type == SPECIES.BROWN:
		collision_layer = 1 << 4
		collision_mask = (1 << 3) | (1 << 2) | (1 << 5) | (1 << 1)
	elif bear_type == SPECIES.POLAR:
		collision_layer = 1 << 5
		collision_mask = (1 << 3) | (1 << 4) | (1 << 2) | (1 << 1)

func _ready():
	load_type()
	load_collisions()

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO
	if bear_state == STATE.EXPLORE:
		direction = (target_dir - global_position).normalized()
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
