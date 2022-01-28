extends KinematicBody2D

var vars = preload("res://scripts/constants.gd")

var velocity = Vector2()

func get_input(delta):
	velocity = Vector2()
	if Input.is_action_pressed("key_right"):
		velocity.x = vars.WALK_SPEED
	if Input.is_action_pressed("key_left"):
		velocity.x = -vars.WALK_SPEED
	
	velocity.y += delta * vars.GRAVITY

func _physics_process(delta):
	get_input(delta)
	velocity = move_and_slide(velocity, Vector2(0, -1))
