extends Area2D

onready var angel = get_parent().get_node("angel")
onready var devil = get_parent().get_node("devil")

func _physics_process(delta):
	if overlaps_body(angel) and overlaps_body(devil):
		get_node("..").gameOver = true
		var text = get_node("../camera/layer/gameOverText")
		text.text = 'YOU DID IT!'
		text.visible = true
