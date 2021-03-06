extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# helper functions
func _set_game_music_value():
	var v = Settings.game_music_value_g
	$OptionsPopupPanel/OptionsVBoxContainer/GameMusicValueHBoxContainer/GameMusicValueLabel2.text = String(v) + "%"
	$OptionsPopupPanel/OptionsVBoxContainer/GameMusicValueHBoxContainer/GameMusicValueHSlider.value = v


func _set_menu_music_value():
	var v = Settings.menu_music_value_g
	$OptionsPopupPanel/OptionsVBoxContainer/MenuMusicValueHBoxContainer/MenuMusicValueLabel2.text = String(v) + "%"
	$OptionsPopupPanel/OptionsVBoxContainer/MenuMusicValueHBoxContainer/MenuMusicValueHSlider.value = v
	if v == 0:
		v = 0.0001
	$AudioStreamPlayer.volume_db = 20 * log(v/100)


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/StartButton.grab_focus()

	# set options on instance reload
	_set_menu_music_value()
	_set_game_music_value()

	# hide exit button in Browser
	if OS.get_name() == "HTML5":
		$VBoxContainer/ExitButton.visible = false
		$OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer.visible = false

	# hide exit button on Nintento Switch
	if OS.get_name() == "Switch":
		$VBoxContainer/ExitButton.visible = false
		$VBoxContainer/OptionsButton.visible = false

	# OptionButton Options
	var max_x_res = OS.get_screen_size().x
	var max_y_res = OS.get_screen_size().y
	$OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.add_item(String(max_x_res) + "x" + String(max_y_res), 0)
	$OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.set_item_metadata(0, Vector2(max_x_res, max_y_res))
	var new_x_res = round(max_x_res * 0.666666)
	var new_y_res = round(max_y_res * 0.666666)
	var res_text = String(new_x_res) + "x" + String(new_y_res)
	$OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.add_item(res_text, 1)
	$OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.set_item_metadata(1, Vector2(new_x_res, new_y_res))
	new_x_res = round(new_x_res * 0.75)
	new_y_res = round(new_y_res * 0.75)
	res_text = String(new_x_res) + "x" + String(new_y_res)
	$OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.add_item(res_text, 2)
	$OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.set_item_metadata(2, Vector2(new_x_res, new_y_res))
	new_x_res = round(new_x_res * 0.666666)
	new_y_res = round(new_y_res * 0.666666)
	res_text = String(new_x_res) + "x" + String(new_y_res)
	$OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.add_item(res_text, 3)
	$OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.set_item_metadata(3, Vector2(new_x_res, new_y_res))
	$OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.select(1)
	_on_OptionButton_item_selected(1)

	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

	if Settings.touch_buttons_set == false:
		if OS.get_name() in ["HTML5", "Android", "iOS"]:
			if OS.has_touchscreen_ui_hint():
				OS.hide_virtual_keyboard()
				Settings.touch_buttons = true

	$OptionsPopupPanel/OptionsVBoxContainer/TouchButtonsCheckButton.pressed = Settings.touch_buttons


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#Input handler, listen for ESC to exit app
func _input(event):
	# Record keys.
	if event is InputEventKey and event.pressed and !event.echo:
		# Quit on Escape press.
		if event.scancode == KEY_ESCAPE:
			if $OptionsPopupPanel.visible:
				$OptionsPopupPanel.visible = false
			elif $CreditsPopupPanel.visible:
				$CreditsPopupPanel.visible = false
			elif $HelpPopupPanel.visible:
				$HelpPopupPanel.visible = false
			else:
				get_tree().quit()

func _on_StartButton_pressed():
	var _active_scene = get_tree().change_scene("res://scenes/" + Settings.currentLevel + ".tscn")

	Settings.angelHeartCount = 4
	Settings.devilHeartCount = 4


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


func _on_OptionButton_item_selected(_index):
	var id = $OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.get_selected_id()
	OS.set_window_size($OptionsPopupPanel/OptionsVBoxContainer/HBoxContainer/OptionButton.get_item_metadata(id))
	# move window possition (error on dual screeen)
	# var screen_size = OS.get_screen_size()
	# var window_size = OS.get_window_size()
	# OS.set_window_position(screen_size*0.5 - window_size*0.5)


func _on_HelpButton_pressed():
	$HelpPopupPanel.visible = true


func _on_HelpCloseButton_pressed():
	$HelpPopupPanel.visible = false


func _on_GameMusicValueHSlider_value_changed(_value):
	Settings.game_music_value_g = $OptionsPopupPanel/OptionsVBoxContainer/GameMusicValueHBoxContainer/GameMusicValueHSlider.value
	_set_game_music_value()


func _on_MenuMusicValueHSlider_value_changed(_value):
	Settings.menu_music_value_g = $OptionsPopupPanel/OptionsVBoxContainer/MenuMusicValueHBoxContainer/MenuMusicValueHSlider.value
	_set_menu_music_value()


func _on_TouchButtonsCheckButton_pressed():
	Settings.touch_buttons = !Settings.touch_buttons
	Settings.touch_buttons_set = true
