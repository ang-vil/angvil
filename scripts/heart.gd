extends Area2D

onready var angel = get_parent().get_node("angel")
onready var devil = get_parent().get_node("devil")

func _on_heart_body_entered(body):
	if body.name == "angel":
		get_parent().get_node("hud").addAngelHeart()
	if body.name == "devil":
		get_parent().get_node("hud").addDevilHeart()
	queue_free()
