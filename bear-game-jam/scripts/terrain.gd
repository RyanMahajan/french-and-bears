extends Area2D
class_name Terrain

@export var background_res: terrain_res
@export var terrain_crystal: int = -1

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
		background_elements.append(elem)

func load_background():
	var bg = ColorRect.new()
	bg.color = background_res.background
	bg.size = Vector2(500, 500)
	background = bg

func create_background():
	var back = background.duplicate()
	back.visible = true
	add_child(back)
	for i in range(2):
		var spawn = spawn_locations.pick_random()
		while spawn.marked:
			spawn = spawn_locations.pick_random()
		spawn.pick()
		var element = background_elements.pick_random().duplicate()
		element.position = spawn.position
		element.visible = true
		add_child(element)

func clear_terrain():
	for element in background_elements:
		element.queue_free()
	background_elements.clear()

func create_terrain():
	collision_layer = 1 << 1
	collision_mask = (1 << 2) | (1 << 3) | (1 << 4) | (1 << 5)
	clear_terrain()
	load_spawns()
	load_elements()
	load_background()
	create_background()

func _on_body_entered(body):
	if body is Bear:
		body.curr_terrain = self
		var bear_terrain = body.get_terrain_res()
		if not body.bear_type == terrain_crystal:
			background_res = bear_terrain
			terrain_crystal = body.bear_type
			create_terrain()

func _ready() -> void:
	create_terrain()
	connect("body_entered", Callable(self, "_on_body_entered"))
