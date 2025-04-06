extends CharacterBody2D
class_name Bear

enum SPECIES {PANDA, BROWN, POLAR, BLACK}
enum STATE {EXPLORE, ATTACK}

@export var bear_type: SPECIES
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var target_dir: Vector2
var curr_terrain: Terrain
var bear_state: STATE = STATE.EXPLORE

const SPEED = 300.0

func load_type():
	if bear_type == SPECIES.PANDA:
		sprite.frames = preload("res://resources/animations/panda_bear_anim.tres")
	elif bear_type == SPECIES.BLACK:
		sprite.frames = preload("res://resources/animations/black_bear_anim.tres")
	elif bear_type == SPECIES.BROWN:
		sprite.frames = preload("res://resources/animations/brown_bear_anim.tres")
	elif bear_type == SPECIES.POLAR:
		sprite.frames = preload("res://resources/animations/polar_bear_anim.tres")

func load_target():
	pass

func load_terrain():
	pass

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

func _ready():
	load_type()
	load_target()
	load_terrain()

func _physics_process(delta: float) -> void:
	pass
