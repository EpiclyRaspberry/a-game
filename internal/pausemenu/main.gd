extends Control

var loadgame = false
var notallowed = ["/root/Control", "/root/mapselector"]

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if not str(get_tree().get_current_scene().get_path()) in notallowed:
			if visible == false:
				AudioServer.set_bus_effect_enabled(0, 0, false)
				get_tree().paused = true
				visible = true
			else:
				AudioServer.set_bus_effect_enabled(0, 0, true)
				get_tree().paused = false
				visible = false
		

func toggleloadgame():
	if loadgame == false:
		$mapselector.visible = true
		loadgame = true
	else:
		$mapselector.visible = false
		loadgame = false


func _on_loadgamebutton_pressed():
	toggleloadgame()
	
func _on_loadmapclose_pressed():
	toggleloadgame()
