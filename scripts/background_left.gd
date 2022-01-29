extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree(), "idle_frame")

	rect_position = Vector2(30, -200)
	rect_size = Vector2(600, 1000)
	rect_rotation = 15


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
