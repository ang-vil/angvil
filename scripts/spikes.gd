extends Area2D

onready var angel = get_parent().get_node("angel")
onready var devil = get_parent().get_node("devil")

func _on_spikes_body_entered(body):
	if body.name == "angel":
		$angelLostLife.play()
		get_parent().get_node("hud").removeAngelHeart()
	if body.name == "devil":
		$devilLostLife.play()
		get_parent().get_node("hud").removeDevilHeart()
		
