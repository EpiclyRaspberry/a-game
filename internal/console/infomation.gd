extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func get_godotversion():
	return "{major}.{minor}".format({"major" :str(Engine.get_version_info().major),"minor": str(Engine.get_version_info().minor)})


func _on_timer_timeout():
	$ScrollContainer/VBoxContainer/fps.text = "FPS: {str}".format({"str": (Performance.get_monitor(Performance.TIME_FPS))} )
	$ScrollContainer/VBoxContainer/peakram.text = "Peak Memory: {str} MB".format({"str": (Performance.get_monitor(Performance.MEMORY_STATIC_MAX) / 1000000 )} )
	$ScrollContainer/VBoxContainer/currentram.text = "Current Memory: {str} MB".format({"str": (Performance.get_monitor(Performance.MEMORY_STATIC) / 1000000 )} )
	$ScrollContainer/VBoxContainer/godotversion.text = "Godot Version: {str}".format({"str": (get_godotversion())} )
	$ScrollContainer/VBoxContainer/processid.text = "PID: {str}".format({"str": (OS.get_process_id())} )
	$ScrollContainer/VBoxContainer/platform.text = "Running On: {str}".format({"str": (OS.get_name())} )
	$ScrollContainer/VBoxContainer/objectcount.text = "Object Count: {str}".format({"str": ((Performance.get_monitor(Performance.OBJECT_COUNT)))} )
	$ScrollContainer/VBoxContainer/resourcecount.text = "Resource Count: {str}".format({"str": (Performance.get_monitor(Performance.OBJECT_RESOURCE_COUNT))} )
	$ScrollContainer/VBoxContainer/videomemory.text = "Video Memory: {str} MB".format({"str": (Performance.get_monitor(Performance.RENDER_VIDEO_MEM_USED) / 1000000)} )
