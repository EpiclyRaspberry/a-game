extends Node

func _ready():
	Console.logconsole("[LIBRARY LOADED] %s" % name)

var ASCII_CHARS = ["@", "#", "$", "%", "?", "*", "+", ";", ":", ",", "."] 
# you can change this list
# based on brightness 

func convert(path):
	var row = ""
	var convertedstring = ""
	
	var img = Image.new()
	img.load(path)
	img.resize(img.get_size().x / 6, img.get_size().y / 6) # resize so ur ram doesnt explode while running
	for ii in range(0, img.get_size().y):
		for i in range(0, img.get_size().x):
			var value = img.get_pixel(i, ii)
			var greyscale = 0.2989 * value[0] + 0.5870 * value[1] + 0.1140 * value[2]
			# copied this formula from stackoverflow
			row += (ASCII_CHARS[(greyscale * len(ASCII_CHARS))])
		convertedstring += "%s\n" % (row)
		row = ""
	return convertedstring
	
	# this is kinda of a pain to work because you draw text horizontally not vecticlly meaning
	# i have to flip the image 
	# this shit takes me forever to figure it out
