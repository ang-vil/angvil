extends ParallaxBackground

const COLOR_HEAVEN = '#9dd1e7'
const COLOR_HELL = '#833a38'

var colorHeaven = COLOR_HEAVEN
var colorHell = COLOR_HELL

onready var heavenNode = get_node("ParallaxLayer/ColorHeaven")
onready var hellNode = get_node("ParallaxLayer/ColorHell")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	heavenNode.set_frame_color(Color(colorHeaven))
	hellNode.set_frame_color(Color(colorHell))
