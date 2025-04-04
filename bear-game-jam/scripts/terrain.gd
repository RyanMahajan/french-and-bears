extends Node2D
class_name Terrain

@export var background_res: terrain_res

var spawn_locations: Array[CustomMark]
var background_elements: Array[Sprite2D]
var background: ColorRect

func load_spawns():
	var spawns = background_res.spawns
	for spawn in spawns:
		var mark = CustomMark.new()
		mark.position = spawn
		spawn_locations.append(mark)

func load_elements():
	var elements = background_res.elements
	for element in elements:
		var elem = Sprite2D.new()
		elem.texture = element
		elem.scale = Vector2(0.1, 0.1)
		background_elements.append(elem)

func load_background():
	var bg = ColorRect.new()
	bg.color = background_res.background
	bg.size = Vector2(500, 500)
	background = bg

func _ready() -> void:
	load_spawns()
	load_elements()
	load_background()
	create_background()


func create_background():
	var back = background.duplicate()
	back.visible = true
	add_child(back)
	for i in range(5):
		var spawn = spawn_locations.pick_random()
		while spawn.marked:
			spawn = spawn_locations.pick_random()
		spawn.pick()
		var element = background_elements.pick_random().duplicate()
		element.position = spawn.position
		element.visible = true
		add_child(element)
