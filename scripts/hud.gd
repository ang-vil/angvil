extends CanvasLayer

var angelHearts = []
var devilHearts = []

var angelFullHeartCount = 4;
var devilFullHeartCount = 4;

func _ready():
	$touchButtonsRight.visible = false
	$touchButtonsLeft.visible = false
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

func removeAngelHeart():
	angelFullHeartCount -= 1
	updateAngelHearts()
	
func removeDevilHeart():
	devilFullHeartCount -= 1
	updateDevilHearts()
	
func updateAngelHearts():
	for angelHeart in angelHearts:
		angelHeart.modulate = Color(0, 0, 0)
	for i in range(angelFullHeartCount):
		angelHearts[i].modulate = Color(1, 1, 1)
	if angelFullHeartCount < 1:
		get_node("..").gameOver('DEVIL wins!')		

func updateDevilHearts():
	for devilHeart in devilHearts:
		devilHeart.modulate = Color(0, 0, 0)
	for i in range(devilFullHeartCount):
		devilHearts[i].modulate = Color(1, 1, 1)
	if devilFullHeartCount < 1:
		get_node("..").gameOver('DEVIL wins!')
		