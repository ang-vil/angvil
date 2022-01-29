extends Area2D

onready var angel = get_parent().get_node("angel")
onready var devil = get_parent().get_node("devil")

func _physics_process(delta):
	if overlaps_body(angel) and overlaps_body(devil):
		print("In goal")
