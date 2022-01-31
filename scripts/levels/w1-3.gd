extends Node

var nextScene = 'levels/w1-4'
var currentScene = 'levels/w1-3'

func _ready():
	get_node("Level").spawn_enemies = false
