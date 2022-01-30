extends Area2D

var vars = preload("res://scripts/constants.gd")
var direction

func _ready():
	$AnimationPlayer.play("rotate")

func _physics_process(delta):
	if direction.x > 0:
		position += transform.x * vars.BULLET_SPEED * delta
	else:
		position -= transform.x * vars.BULLET_SPEED * delta

func _on_bullet_body_entered(body):
	if body.name != "angel" and body.name != "devil":
		queue_free()
