extends Node

var isGameOver = false
var nextScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(_event):
	# Record keys.
	if Input.is_action_pressed("key_pause"):
		var _active_scene = get_tree().change_scene("res://scenes/menu.tscn")

	if isGameOver:
		if Input.is_action_pressed("ui_cancel") or Input.is_action_pressed("ui_accept"):
			var _active_scene = get_tree().change_scene("res://scenes/" + nextScene + ".tscn")

func gameOver(message, win = false):
	if win:
		nextScene = get_node("..").nextScene
	else:
		nextScene = get_node("..").currentScene
	isGameOver = true
	var text = get_node("camera/layer/gameOverText")
	text.text = message
	text.visible = true
