extends Marker2D
class_name CustomMark

var marked: bool = false

func pick() -> void:
	marked = true

func unpick() -> void:
	marked = false
