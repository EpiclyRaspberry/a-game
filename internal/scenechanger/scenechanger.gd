extends CanvasLayer

var changefrom
var progress = []
var pathinternal = ""
var status = 0

func change_scene(path):
	pathinternal = path
	visible = true
	ResourceLoader.load_threaded_request(path)
	
func _process(delta):
	status = ResourceLoader.load_threaded_get_status(pathinternal, progress)
	if status == ResourceLoader.THREAD_LOAD_LOADED:
		visible = false
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(pathinternal	))
