extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var res_scale = [40, 60, 80, 100, 120, 160, 240, 320, 400, 480]


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
	for k in res_scale.size():
		var x = 16 * res_scale[k]
		var y = 9 * res_scale[k]
		var t = "%s x %s" % [x, y]
		$OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.add_item(t, k)
		$OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.set_item_metadata(k, Vector2(x, y))
	
	$OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.select(2)
	OS.set_window_size($OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.get_item_metadata(2))


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
