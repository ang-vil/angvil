extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree(), "idle_frame")

	rect_position = Vector2(512, 0)
	rect_size = Vector2(512, 600)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
