extends Control

var click_pos = Vector2.ZERO
var mousein

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if OS.is_debug_build():
		
		#print(OS.get_static_memory_usage()/1000000)
		if Input.is_action_just_pressed("toggleconsole"):
			toggleconsolevisible()
	if Input.is_action_just_pressed("mouseleft"):
		click_pos = get_local_mouse_position()	
	if Input.is_action_pressed("mouseleft"):
		position =(
			Vector2(position) +	
			get_local_mouse_position() - 
			click_pos
		)

func logconsole(thing):
	$base/ScrollContainer/VBoxContainer.printer(thing)

func toggleconsolevisible():
		if visible == false:
			visible = true
		else:
			visible = false
