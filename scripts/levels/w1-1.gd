extends Node

var nextScene = 'levels/w1-2'
var currentScene = 'levels/w1-1'

func _ready():
	get_node("Level").spawn_enemies = false
	get_node("Level").spawn_enemies_min_sec = 0
	get_node("Level").spawn_enemies_max_sec = 0.5


func _on_enemies_enabled_body_entered(body):
	if body.name == "angel" or body.name == "devil":
		get_node("Level").spawn_enemies = true
		yield(get_tree().create_timer(0.6), "timeout")
		get_node("Level").spawn_enemies = false
		get_node("Level").spawn_enemies_min_sec = 2
		get_node("Level").spawn_enemies_max_sec = 5
