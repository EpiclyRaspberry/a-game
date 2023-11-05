extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func _on_play_button_pressed():
	Scenechanger.change_scene("res://maps/mapselector.tscn")
	

func _on_crash_pressed():
	Gv.crashcomputer()


func _on_notification_pressed():
#	Notification.send("shoutout", "amazer but normal", "normal")
	Notification.send("shoutout", "amazer but rgb", "chroma")


func _on_gototest_pressed():
	Scenechanger.change_scene("res://testing/blank-scene.tscn")
