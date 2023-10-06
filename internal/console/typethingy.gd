extends LineEdit


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if Input.is_key_pressed(KEY_ENTER):
		if text == "":
			return
		Console.logconsole(evaluate(text))
		clear()
		
func evaluate(input):
	var expression = Expression.new()
	expression.parse(str(input))
	var result = expression.execute([], get_tree().get_current_scene())
	return result

