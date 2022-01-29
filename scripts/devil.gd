extends KinematicBody2D

var vars = preload("res://scripts/constants.gd")
var math = preload("res://scripts/helper/math.gd")

var velocity = Vector2()
var jumping = false

func get_input(delta):
	if Input.is_action_pressed("key_right"):
		get_node("Sprite").set_flip_h(false)
		velocity.x = lerp(velocity.x, vars.WALK_SPEED, 0.3)
	elif Input.is_action_pressed("key_left"):
		get_node("Sprite").set_flip_h(true)
		velocity.x = lerp(velocity.x, vars.WALK_SPEED*-1, 0.3)
	else:
		# smoothen walk
		velocity.x = lerp(velocity.x, 0, 0.1)

	if Input.is_action_pressed("key_up") and velocity.y == 0:
		jumping = true;

	if jumping:
		velocity.y = lerp(velocity.y, vars.JUMP_SPEED, 0.6)
		
		if math.compare_float(velocity.y, vars.JUMP_SPEED):
			jumping = false
	else:
		velocity.y -= delta * vars.GRAVITY

func _physics_process(delta):
	get_input(delta)
	velocity = move_and_slide(velocity)
