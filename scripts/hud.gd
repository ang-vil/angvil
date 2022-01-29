extends CanvasLayer

func _on_viewport_size_changed():
	$Control.set_h_size_flags(Control.SIZE_EXPAND_FILL)
	$Control.set_anchors_preset(Control.PRESET_WIDE)
	$Control.set_anchors_and_margins_preset(Control.PRESET_TOP_WIDE)

func _ready():
	$Control.set_h_size_flags(Control.SIZE_EXPAND_FILL)
	$Control.set_anchors_preset(Control.PRESET_WIDE)
	$Control.set_anchors_and_margins_preset(Control.PRESET_TOP_WIDE)
