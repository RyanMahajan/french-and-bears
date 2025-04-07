# ZoneGenerator.gd
extends Node

class_name ZoneGenerator

var noise := FastNoiseLite.new()
var frequency := 0.01
var num_zones := 6

func _init():
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	noise.seed = randi()
	noise.frequency = frequency

func get_zone_id(x: int, y: int) -> int:
	var val = noise.get_noise_2d(x * frequency, y * frequency)
	val = (val + 1.0) * 0.5  # Normalize to 0–1
	return int(floor(val * num_zones))
