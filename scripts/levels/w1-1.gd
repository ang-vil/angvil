extends Node

var gameOver = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	# Record keys.
	if Input.is_action_pressed("key_pause"):
			get_tree().change_scene("res://scenes/menu.tscn")
