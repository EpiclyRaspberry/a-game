extends Label

var test = Library.get_node("text_to_ascii_art").convert("5 bands in my wallet", "res://assets/fonts/figlet/basic.flf")

# Called when the node enters the scene tree for the first time.
func _ready():
	text = test
	Console.log(test)
