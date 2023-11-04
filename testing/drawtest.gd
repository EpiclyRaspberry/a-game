extends Label

var test = Library.get_node("img_to_ascii_art").convert("res://assets/images/boykisser.jpg")

# Called when the node enters the scene tree for the first time.
func _ready():
	print(test)
	text = test
	#$Label2.text = test2
	#queue_redraw()
