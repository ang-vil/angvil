extends Node


func _input(_event):
	if Input.is_action_pressed("ui_cancel") or Input.is_action_pressed("ui_accept") or Input.is_action_pressed("key_pause"):
		var _active_scene = get_tree().change_scene("res://scenes/menu.tscn")
