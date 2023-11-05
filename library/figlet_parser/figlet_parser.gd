extends Node

func _ready():
	Console.log("[LIBRARY LOADED] %s 1.0" % name)
	
func parse(path):
	var file = FileAccess.open(path, FileAccess.READ)
	var notstripcontent = file.get_as_text().split("\n")
	var content = []
	for i in notstripcontent:
		content.append(i.strip_escapes())
		
	var metadata = content[0].split("flf2a")[1].split(" ")

#Explanation of first line:
#flf2 - "magic number" for file identification
#a    - should always be `a', for now
#$    - the "hardblank" -- prints as a blank, but can't be smushed
#4    - height of a character
#4    - height of a character, not including descenders
#0    - default smushmode for this font (like "-m 0" on command line)
#13   - number of comment lines
	
	var blankchar = metadata[0]
	var height = int(metadata[1])
	var height_without_descender = metadata[2]
	var commentline = int(metadata[5])
	var cutchar = content[commentline + height].right(2)

#	var displayside
#	if int(metadata[4]) < 1:
#		displayside = "left-to-right"
#	else:
#		displayside = "right-to-left"

	var char = []
	var onechar = ""
		
	for i in range(len(content)):
		if i > commentline:
			if content[i].right(2) == cutchar:
				if len(onechar.split("\n")) <= height:
					char.append(onechar)
				onechar = ""
			else:
#				if (content[i].replace(blankchar, "").replace(cutchar.left(1), "")) != "":
				onechar += (content[i].replace(blankchar, "").replace(cutchar.left(1), "\n"))
#				else:
#					onechar = " "	
	var chartranslate = {}
	var charnum = 0
	for i in range(32, 127):
		chartranslate[String.chr(i)] = char[charnum]
		charnum += 1
	
	return chartranslate
