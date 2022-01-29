extends CanvasLayer

func _ready():
	if OS.get_name() in ["HTML5", "Android", "iOS"]:
		if OS.has_touchscreen_ui_hint():
			OS.hide_virtual_keyboard()
			$touchButtons.visible = true
		
