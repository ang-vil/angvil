extends CanvasLayer

func _ready():
	$Control/DebugText.text = OS.get_name() + " on " + OS.get_model_name()
	if OS.get_name() in ["iOS", "Android"]:
		if OS.get_name() == "HTML5" and OS.get_model_name() == "Heinz":
			$Control/touchButtons.visible = true
