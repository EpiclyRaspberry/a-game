extends CanvasLayer

func _ready():
	if OS.is_debug_build():
		visible = true
