extends Control

var loadgame = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if visible == false:
			get_tree().paused = true
			visible = true
		else:
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
