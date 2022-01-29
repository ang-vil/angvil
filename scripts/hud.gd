extends CanvasLayer

func _ready():
	if OS.has_touchscreen_ui_hint():
		OS.hide_virtual_keyboard()
		$touchButtons.visible = true
		
