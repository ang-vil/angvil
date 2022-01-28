extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var keys_typed = []


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#Input handler, listen for ESC to exit app
func _input(event):
	# Record keys.
	if event is InputEventKey and event.pressed and !event.echo:
		keys_typed.append(OS.get_scancode_string(event.scancode))
		# Quit on Escape press.
		if event.scancode == KEY_ESCAPE:
			var active_scene = get_tree().change_scene("res://scenes/menu.tscn")
	# Quit on any mouse click.
	# if event is InputEventMouseButton:
	#	quit = true
