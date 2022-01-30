extends Area2D

var vars = preload("res://scripts/constants.gd")

func _physics_process(delta):
		position -= transform.x * vars.ENEMY_SPEED * delta

func _on_enemy_dove_body_entered(body):
	if body.name == "devil":
		get_parent().get_node("Level").get_node("hud").removeDevilHeart()
	queue_free()


func _on_enemy_dove_area_entered(area):
	if "bullet" in area.name:
		queue_free()
