extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree(), "idle_frame")
	#var bottom = Vector2()
	#bottom.rect_scale
	rect_scale = Vector2(1, -1)
	rect_position = Vector2(0, 600)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
