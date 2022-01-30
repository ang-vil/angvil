extends KinematicBody2D

var iAmDead = false

var vars = preload("res://scripts/constants.gd")
var math = preload("res://scripts/helper/math.gd")

var velocity = Vector2()
var jumping = false

var bullet = preload("res://scenes/bullet.tscn")
var direction = Vector2(1, 0)

var firstRun = true

func get_input(delta):
	if Input.is_action_pressed("key_right"):
		get_node("Sprite").set_flip_h(false)
		direction.x = 1
		velocity.x = lerp(velocity.x, vars.WALK_SPEED, 0.3)
		if velocity.y == 0:
			$AnimationPlayer.play("walk")
	elif Input.is_action_pressed("key_left"):
		get_node("Sprite").set_flip_h(true)
		direction.x = -1
		velocity.x = lerp(velocity.x, vars.WALK_SPEED*-1, 0.3)
		if velocity.y == 0:
			$AnimationPlayer.play("walk")
	else:
		# smoothen walk
		velocity.x = lerp(velocity.x, 0, 0.1)

	if Input.is_action_just_pressed("shoot"):
		shoot()

	if Input.is_action_just_pressed("key_up") and velocity.y == 0:
		jumping = true;
		$AnimationPlayer.play("jump")
		
	if Input.is_action_pressed("key_down"):
		get_node("Sprite").scale.y = -0.5
		get_node("Sprite").offset.y = 20
		get_node("CollisionShape2D").scale.y = 0.5
		get_node("CollisionShape2D").position.y = -8
	else:
		get_node("Sprite").scale.y = -1
		get_node("Sprite").offset.y = 0
		get_node("CollisionShape2D").scale.y = 1
		get_node("CollisionShape2D").position.y = 0

	if jumping:
		velocity.y = lerp(velocity.y, vars.JUMP_SPEED, 0.8)
		
		if math.compare_float(velocity.y, vars.JUMP_SPEED):
			jumping = false
	else:
		velocity.y -= delta * vars.GRAVITY

func shoot():
	var b = bullet.instance()
	b.direction = direction
	b.setType('star')
	owner.add_child(b)
	b.transform = $bulletspawn.global_transform

func _physics_process(delta):
	if get_node("..").isGameOver:
		velocity = Vector2()
	else:
		get_input(delta)
	velocity = move_and_slide(velocity)

func _process(_delta):
	if firstRun:
		firstRun = false

		return

	if not get_node('devil_visibility').is_on_screen() and not iAmDead:
		iAmDead = true
		var background = get_node("../background/")
		get_parent().get_node("hud").removeDevilHeart()
		background.colorHell = background.COLOR_HEAVEN
		yield(get_tree().create_timer(3.0), "timeout")
		background.colorHell = background.COLOR_HELL
		if Settings.devilHeartCount > 0:
			get_node("..").restartLevel()
