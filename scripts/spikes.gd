extends Area2D

onready var angel = get_parent().get_node("angel")
onready var devil = get_parent().get_node("devil")

func _on_spikes_body_entered(body):
	if body.name == "angel":
		get_parent().get_node("hud").removeAngelHeart()
		$angelLostLife.play()
	if body.name == "devil":
		get_parent().get_node("hud").removeDevilHeart()
		$devilLostLife.play()
		
