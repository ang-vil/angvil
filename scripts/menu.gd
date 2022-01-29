extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/StartButton.grab_focus()
	# hide exit button in Browser
	if OS.get_name() == "HTML5":
		$VBoxContainer/ExitButton.visible = false
	# hide exit button on Nintento Switch
	if OS.get_name() == "Switch":
		$VBoxContainer/ExitButton.visible = false
	# OptionButton Options
	$OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.add_item("1024 x 600", 0)
	$OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.set_item_metadata(0, Vector2(1024, 600))
	$OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.add_item("1920 x 1080", 1)
	$OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.set_item_metadata(1, Vector2(1920, 1080))
	$OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.add_item("400 x 400", 2)
	$OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.set_item_metadata(2, Vector2(400, 400))


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
	var _active_scene = get_tree().change_scene("res://scenes/levels/w1-1.tscn")


func _on_OptionsButton_pressed():
	$OptionsPopupPanel.popup()


func _on_OptionsCloseButton_pressed():
	$OptionsPopupPanel.visible = false


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_CreditsButton_pressed():
	$CreditsPopupPanel.popup()


func _on_CreditsCloseButton_pressed():
	$CreditsPopupPanel.visible = false


func _on_CheckButton_pressed():
	OS.window_fullscreen = !OS.window_fullscreen


func _on_OptionButton_item_selected(index):
	var id = $OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.get_selected_id()
	OS.set_window_size($OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.get_item_metadata(id))
