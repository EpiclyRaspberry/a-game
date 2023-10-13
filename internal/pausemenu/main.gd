extends Control

var loadgame = false
var notallowed = ["/root/MainMenu", "/root/mapselector"]

func _process(delta):
#	get_tree().get_current_scene().mouse_filter = Control.MOUSE_FILTER_IGNORE
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		togglepausemenu()

func togglepausemenu():
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
	if $CanvasLayer/mapselector.visible == false:
		$CanvasLayer/mapselector.visible = true
	else:	
		$CanvasLayer/mapselector.visible = false

func togglesetting():
	if $CanvasLayer/setting.visible == false:
		$CanvasLayer/setting.visible = true
	else:
		$CanvasLayer/setting.visible = false


func _on_loadgamebutton_pressed():
	toggleloadgame()
	
func _on_loadmapclose_pressed():
	toggleloadgame()


func _on_settingbutton_pressed():
	togglesetting()


func _on_settingclose_pressed():
	togglesetting()


func _on_resumebutton_pressed():
	togglepausemenu()


func _on_quitbutton_pressed():
	togglepausemenu()
	Scenechanger.change_scene("res://main.tscn")
