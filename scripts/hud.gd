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
	angelHearts.push_back($AngelScore/AngelHeart5)
	angelHearts.push_back($AngelScore/AngelHeart6)

	devilHearts.push_back($DevilScore/DevilHeart1)
	devilHearts.push_back($DevilScore/DevilHeart2)
	devilHearts.push_back($DevilScore/DevilHeart3)
	devilHearts.push_back($DevilScore/DevilHeart4)
	devilHearts.push_back($DevilScore/DevilHeart5)
	devilHearts.push_back($DevilScore/DevilHeart6)
	
	updateAngelHearts()
	updateDevilHearts()

func addAngelHeart():
	get_node("../angel/gainLife").play()
	Settings.angelHeartCount += 1
	
	if Settings.angelHeartCount > Settings.maxAngelHeartCount:
		Settings.angelHeartCount = Settings.maxAngelHeartCount
	
	updateAngelHearts()
	
func addDevilHeart():
	get_node("../devil/gainLife").play()
	Settings.devilHeartCount += 1
	
	if Settings.devilHeartCount > Settings.maxDevilHeartCount:
		Settings.devilHeartCount = Settings.maxDevilHeartCount
	
	updateAngelHearts()

func removeAngelHeart():
	get_node("../angel/lostLife").play()
	Settings.angelHeartCount -= 1
	updateAngelHearts()
	
func removeDevilHeart():
	get_node("../devil/lostLife").play()
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
		
