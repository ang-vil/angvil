extends CanvasLayer

var angelHearts = []
var devilHearts = []

func _ready():
	if OS.get_name() in ["HTML5", "Android", "iOS"]:
		if OS.has_touchscreen_ui_hint():
			OS.hide_virtual_keyboard()
			$touchButtonsRight.visible = true
			$touchButtonsLeft.visible = true
		
	angelHearts.push_back($AngelScore/AngelHeart1)
	angelHearts.push_back($AngelScore/AngelHeart2)
	angelHearts.push_back($AngelScore/AngelHeart3)
	angelHearts.push_back($AngelScore/AngelHeart4)

	devilHearts.push_back($DevilScore/DevilHeart1)
	devilHearts.push_back($DevilScore/DevilHeart2)
	devilHearts.push_back($DevilScore/DevilHeart3)
	devilHearts.push_back($DevilScore/DevilHeart4)

