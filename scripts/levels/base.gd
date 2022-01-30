extends Node

var isGameOver = false
var nextScene

var enemy_dove = preload("res://scenes/enemy_dove.tscn")
var enemy_trident = preload("res://scenes/enemy_trident.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Settings.currentLevel = get_node("..").currentScene
	# set music volume from settings
	$music.volume_db = 20 * log(Settings.game_music_value_g/100)

	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

	# randomly spawn enemies
	randomize()
	var random_time
	var random_enemy
	var random_height
	var viewport_height = get_viewport().get_visible_rect().size.y
	while(true):
		random_time = rand_range(2,5)
		random_enemy = rand_range(0,2)
		random_height = rand_range(0, viewport_height / 2)
		yield(get_tree().create_timer(random_time),"timeout")
		if random_enemy < 1:
			spawn_enemy('dove', random_height)
		else:
			spawn_enemy('trident', random_height * -1)


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
		nextScene = "menu"
	isGameOver = true
	var text = get_node("camera/layer/gameOverText")
	text.text = message
	text.visible = true

	yield(get_tree().create_timer(3.0), "timeout")
	var _active_scene = get_tree().change_scene("res://scenes/" + nextScene + ".tscn")


func spawn_enemy(enemy_name, height):
	var enemy
	if enemy_name == 'dove':
		enemy = enemy_dove.instance()
		enemy.transform = $camera/dove_spawn.global_transform
	else:
		enemy = enemy_trident.instance()
		enemy.transform = $camera/trident_spawn.global_transform
	enemy.transform.origin.y = height
	owner.add_child(enemy)

func restartLevel():
	get_tree().change_scene("res://scenes/" + get_node("..").currentScene + ".tscn")
