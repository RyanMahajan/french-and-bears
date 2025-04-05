extends CharacterBody2D
class_name Bear

enum SPECIES {PANDA, BROWN, POLAR, BLACK}
enum STATE {EXPLORE, ATTACK}

@export var bear_type: SPECIES
@export var sprite: AnimatedSprite2D

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

func _ready():
	load_type()
	load_target()
	load_terrain()

func _physics_process(delta: float) -> void:
	pass
