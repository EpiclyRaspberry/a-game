extends Control

var loadgame = false
var notallowed = ["/root/Control", "/root/mapselector"]

func _process(delta):
#	get_tree().get_current_scene().mouse_filter = Control.MOUSE_FILTER_IGNORE
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if not str(get_tree().get_current_scene().get_path()) in notallowed:
			if $CanvasLayer.visible == false:
				AudioServer.set_bus_effect_enabled(0, 0, true)
				get_tree().paused = true
				$CanvasLayer.visible = true
			else:
				AudioServer.set_bus_effect_enabled(0, 0, false)
				get_tree().paused = false
				$CanvasLayer.visible = false


func toggleloadgame():
	if loadgame == false:
		$CanvasLayer/mapselector.visible = true
		loadgame = true
	else:
		$CanvasLayer/mapselector.visible = false
		loadgame = false


func _on_loadgamebutton_pressed():
	toggleloadgame()
	
func _on_loadmapclose_pressed():
	toggleloadgame()
