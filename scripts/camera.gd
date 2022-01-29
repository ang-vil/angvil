extends Camera2D

onready var angel = get_node("../angel")
onready var devil = get_node("../devil")

func _physics_process(_delta):
	if angel.position.x > devil.position.x:
		position.x = devil.position.x + (angel.position.x - devil.position.x) / 2.0
	else:
		position.x = angel.position.x + (devil.position.x - angel.position.x) / 2.0
