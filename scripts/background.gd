extends ParallaxBackground

const HEAVEN_COLOR = '#9dd1e7'
const HELL_COLOR = '#833a38'

var colorHeaven = '#9dd1e7'
var colorHell = '#833a38'

onready var heavenNode = get_node("ParallaxLayer/ColorHeaven")
onready var hellNode = get_node("ParallaxLayer/ColorHell")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	heavenNode.set_frame_color(Color(colorHeaven))
	hellNode.set_frame_color(Color(colorHell))
