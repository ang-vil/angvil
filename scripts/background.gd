extends ParallaxBackground

const COLOR_HEAVEN = '#9dd1e7'
const COLOR_HELL = '#833a38'

var colorHeaven = '#9dd1e7'
var colorHell = '#833a38'

onready var heavenNode = get_node("ParallaxLayer/ColorHeaven")
onready var hellNode = get_node("ParallaxLayer/ColorHell")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	heavenNode.set_frame_color(Color(COLOR_HEAVEN))
	hellNode.set_frame_color(Color(COLOR_HELL))
