extends LineEdit

var senttext = []
var counter = 0

func _input(event):
	if Input.is_key_pressed(KEY_ENTER):
		if text == "":
			return
		Console.log(evaluate(text))
		senttext.append(text)
		clear()
		
	if Input.is_key_pressed(KEY_UP):
		if counter < len(senttext):
			counter += 1
			text = senttext[-(counter)]
	if Input.is_key_pressed(KEY_DOWN):
		if counter > 1:
			counter -= 1
			text = senttext[-(counter)]
	if not text in senttext:
		counter = 0
		
func evaluate(input):
	var expression = Expression.new()
	expression.parse(str(input))
	var result = expression.execute([], get_tree().get_current_scene())
	return result
