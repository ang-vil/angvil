extends Node

var nextScene = 'levels/w1-5'
var currentScene = 'levels/w1-4'

func _ready():
	get_node("Level").spawn_enemies = false
