extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


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
		# Quit on Escape press.
		if event.scancode == KEY_ESCAPE:
			get_tree().quit()


func _on_StartButton_pressed():
	var active_scene = get_tree().change_scene("res://scenes/level.tscn")


func _on_OptionsButton_pressed():
	$OptionsPopupPanel.popup()


func _on_OptionsCloseButton_pressed():
	$OptionsPopupPanel.visible = false


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_FullscreenCheckBox_pressed():
	OS.window_fullscreen = !OS.window_fullscreen


func _on_CreditsButton_pressed():
	$CreditsPopupPanel.popup()


func _on_CreditsCloseButton_pressed():
	$CreditsPopupPanel.visible = false
