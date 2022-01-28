extends KinematicBody2D


func _physics_process(delta):
	move_and_collide(Vector2(0, -1)) # Move down 1 pixel per physics frame
