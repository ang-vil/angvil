extends KinematicBody2D

var vars = preload("res://scripts/constants.gd")
var math = preload("res://scripts/helper/math.gd")

var velocity = Vector2()
var jumping = false

var bullet = preload("res://scenes/bullet.tscn")
var direction = Vector2(1, 0)

func get_input(delta):
	if Input.is_action_pressed("key_right"):
		get_node("Sprite").set_flip_h(false)
		direction.x = 1
		velocity.x = lerp(velocity.x, vars.WALK_SPEED, 0.3)
	elif Input.is_action_pressed("key_left"):
		get_node("Sprite").set_flip_h(true)
		direction.x = -1
		velocity.x = lerp(velocity.x, vars.WALK_SPEED*-1, 0.3)
	else:
		# smoothen walk
		velocity.x = lerp(velocity.x, 0, 0.1)
		
	if Input.is_action_just_pressed("shoot"):
		shoot()

	if Input.is_action_just_pressed("key_up") and velocity.y == 0:
		jumping = true;
		$jumpsound.play()

	if jumping:
		velocity.y = lerp(velocity.y, vars.JUMP_SPEED*-1, 0.8)
		
		if math.compare_float(velocity.y, vars.JUMP_SPEED * -1):
			jumping = false
	else:
		velocity.y += delta * vars.GRAVITY

func shoot():
	var b = bullet.instance()
	b.direction = direction
	owner.add_child(b)
	b.transform = $bulletspawn.global_transform

func _physics_process(delta):
	if get_node("..").gameOver:
		velocity = Vector2()
	else:
		get_input(delta)
	velocity = move_and_slide(velocity)

func _process(_delta):
	yield(get_tree(), "idle_frame")
	if not get_node('angle_visibility').is_on_screen():
		var background = get_node("../background/")
		background.colorHeaven = background.HELL_COLOR
		get_node("..").gameOver = true
