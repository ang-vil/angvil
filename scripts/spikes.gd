extends Area2D

onready var angel = get_parent().get_node("angel")
onready var devil = get_parent().get_node("devil")

func _physics_process(_delta):
	if overlaps_body(angel):
		get_node("..").gameOver('DEVIL wins!')
	elif overlaps_body(devil):
		get_node("..").gameOver('ANGEL wins!')
