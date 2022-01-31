extends Node

var nextScene = 'levels/w1-6'
var currentScene = 'levels/w1-5'

func _ready():
	get_node("Level").spawn_enemies = false
