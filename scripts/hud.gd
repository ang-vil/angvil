extends CanvasLayer

func _ready():
	if OS.get_name() == "HTML5" or OS.get_name() == "iOS" or OS.get_name() == "Android":
		$Control/touchButtons.visible = true
