extends Control	

func _process(delta):
	if OS.is_debug_build():
		if Input.is_action_just_pressed("toggleconsole"):
			toggleconsolevisible()

func log(thing):
	$CanvasLayer/base/ScrollContainer/VBoxContainer.printer(thing)

func toggleconsolevisible():
		if $CanvasLayer.visible == false:
			$CanvasLayer.visible = true
		else:
			$CanvasLayer.visible = false
