extends Area2D

onready var angel = get_parent().get_node("angel")
onready var devil = get_parent().get_node("devil")

func _physics_process(_delta):
	if overlaps_body(angel):
		get_parent().get_node("hud").removeAngelHeart()
		angel.jumping = true
	elif overlaps_body(devil):
		get_parent().get_node("hud").removeDevilHeart()
		devil.jumping = true
