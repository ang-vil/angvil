extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var keys_typed = []


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/StartButton.grab_focus()


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
			get_tree().quit()
	# Quit on any mouse click.
	# if event is InputEventMouseButton:
	#	quit = true


func _on_StartButton_pressed():
	var active_scene = get_tree().change_scene("res://scenes/Level.tscn")


func _on_OptionsButton_pressed():
	# if we have a lot of option we can add a option scene
	pass # Replace with function body.


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_FullscreenCheckBox_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
