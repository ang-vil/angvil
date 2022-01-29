extends KinematicBody2D

var vars = preload("res://scripts/constants.gd")
var math = preload("res://scripts/helper/math.gd")

var velocity = Vector2()
var jumping = false
var canMoveInAir = false

func get_input(delta):
	if Input.is_action_pressed("key_right"):
		if velocity.y == 0 or canMoveInAir:
			canMoveInAir = false
			get_node("Sprite").set_flip_h(false)
			velocity.x = lerp(velocity.x, vars.WALK_SPEED, 0.3)
	elif Input.is_action_pressed("key_left"):
		if velocity.y == 0 or canMoveInAir:
			canMoveInAir = false
			get_node("Sprite").set_flip_h(true)
			velocity.x = lerp(velocity.x, vars.WALK_SPEED*-1, 0.3)
	else:
		# smoothen walk
		velocity.x = lerp(velocity.x, 0, 0.1)

	if Input.is_action_just_pressed("key_up") and velocity.y == 0:
		jumping = true
		canMoveInAir = true

	if jumping:
		velocity.y = lerp(velocity.y, vars.JUMP_SPEED, 0.8)
		
		if math.compare_float(velocity.y, vars.JUMP_SPEED):
			jumping = false
	else:
		velocity.y -= delta * vars.GRAVITY

func _physics_process(delta):
	get_input(delta)
	velocity = move_and_slide(velocity)

func _process(delta):
	yield(get_tree(), "idle_frame")
	if not get_node('devil_visibility').is_on_screen():
		var background = get_node("../background/")
		background.colorHell = background.HEAVEN_COLOR
