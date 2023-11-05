extends Node

func convert(text, figlet_font_file):
	var char = get_parent().get_node("figlet_parser").parse(figlet_font_file)
	var art = ""
	var lines = {}
	for i in text:
		for ii in range(len(char[i].split("\n"))):
			if len(lines) > ii:
				lines[ii] = lines[ii] + (char[i]).split("\n")[ii]
			else:
				lines[ii] = (char[i]).split("\n")[ii]
	for i in lines:
		art += "%s\n" % (lines[i])
	return art
