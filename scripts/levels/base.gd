extends Node

var isGameOver = false

# Called when the node enters the scene tree for the first time.
func _ready():
	# set music volume from settings
	$music.volume_db = Settings.game_music_value_g


func _input(_event):
	# Record keys.
	if Input.is_action_pressed("key_pause"):
		var _active_scene = get_tree().change_scene("res://scenes/menu.tscn")

	if isGameOver:
		if Input.is_action_pressed("ui_cancel") or Input.is_action_pressed("ui_accept"):
			var _active_scene = get_tree().change_scene("res://scenes/menu.tscn")

func gameOver(message):
	isGameOver = true
	var text = get_node("camera/layer/gameOverText")
	text.text = message
	text.visible = true
