extends Node

var nextScene = 'menu_completed'
var currentScene = 'levels/w1-6'

func _ready():
	get_node("Level").spawn_enemies = false
