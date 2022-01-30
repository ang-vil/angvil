extends CanvasLayer

var angelHearts = []
var devilHearts = []

var angelFullHeartCount = 4;
var devilFullHeartCount = 4;

func _ready():
	$touchButtonsRight.visible = Settings.touch_buttons
	$touchButtonsLeft.visible = Settings.touch_buttons
	$touchButtonX.visible = Settings.touch_buttons
		
	angelHearts.push_back($AngelScore/AngelHeart1)
	angelHearts.push_back($AngelScore/AngelHeart2)
	angelHearts.push_back($AngelScore/AngelHeart3)
	angelHearts.push_back($AngelScore/AngelHeart4)

	devilHearts.push_back($DevilScore/DevilHeart1)
	devilHearts.push_back($DevilScore/DevilHeart2)
	devilHearts.push_back($DevilScore/DevilHeart3)
	devilHearts.push_back($DevilScore/DevilHeart4)
	
	updateAngelHearts()
	updateDevilHearts()

func addAngelHeart():
	Settings.angelHeartCount += 1
	
	if Settings.angelHeartCount > 4:
		Settings.angelHeartCount = 4
	
	updateAngelHearts()
	
func addDevilHeart():
	Settings.devilHeartCount += 1
	
	if Settings.devilHeartCount > 4:
		Settings.devilHeartCount = 4
	
	updateAngelHearts()

func removeAngelHeart():
	$angelLostLife.play()
	Settings.angelHeartCount -= 1
	updateAngelHearts()
	
func removeDevilHeart():
	$devilLostLife.play()
	Settings.devilHeartCount -= 1
	updateDevilHearts()
	
func updateAngelHearts():
	for angelHeart in angelHearts:
		angelHeart.modulate = Color(0, 0, 0)
	for i in range(Settings.angelHeartCount):
		angelHearts[i].modulate = Color(1, 1, 1)
	if Settings.angelHeartCount < 1:
		get_node("..").gameOver('DEVIL wins!')

func updateDevilHearts():
	for devilHeart in devilHearts:
		devilHeart.modulate = Color(0, 0, 0)
	for i in range(Settings.devilHeartCount):
		devilHearts[i].modulate = Color(1, 1, 1)
	if Settings.devilHeartCount < 1:
		get_node("..").gameOver('ANGEL wins!')
		
