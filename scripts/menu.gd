extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/Level.tscn")


func _on_OptionsButton_pressed():
	# if we have a lot of option we can add a option scene
	pass # Replace with function body.


func _on_ExitButton_pressed():
	get_tree().quit()
