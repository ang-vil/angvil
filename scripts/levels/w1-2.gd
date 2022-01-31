extends Node

var nextScene = 'levels/w1-3'
var currentScene = 'levels/w1-2'

func _ready():
	get_node("Level").spawn_enemies = false
