extends Control	

func _process(delta):
	if OS.is_debug_build():
		if Input.is_action_just_pressed("toggleconsole"):
			toggleconsolevisible()

func log(thing):
	$CanvasLayer/base/ScrollContainer/VBoxContainer.printer(thing)

func toggleconsolevisible():
	
	var tween = get_tree().create_tween()
	
	if $CanvasLayer.visible == false:
		$CanvasLayer.visible = true
		tween.tween_property($CanvasLayer, "scale", Vector2(1, 1), 0.2).set_trans(Tween.TRANS_CUBIC)
	else:
		tween.tween_property($CanvasLayer, "scale", Vector2(2, 0.001), 0.1).set_trans(Tween.TRANS_CUBIC)
		tween.tween_callback($CanvasLayer.hide)
		
	
