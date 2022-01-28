extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree(), "idle_frame")

	rect_scale = Vector2(1, -1)
	rect_position = Vector2(0, 600)
	rect_size = Vector2(1024, 300)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
