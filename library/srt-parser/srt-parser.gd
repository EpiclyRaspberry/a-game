extends Node

func _ready():
	Console.log("[LIBRARY LOADED] %s 1.0" % name)

func parse(path):
	var file = FileAccess.open(path, FileAccess.READ)
	var content = file.get_as_text().split("\n")
	var parsed = []
	var tempparsed = []
	var contenting = []
	var text = ""
	for i in content:
		tempparsed.append(i.replace("\n", ""))
	for i in tempparsed:
		if i != "":
			if contenting == []:
				contenting.append(float(i))
			elif "-->" in i:
				for ting in i.split("-->"):
					contenting.append((float(ting.replace(",", ".").replace(" ", "").split(":")[0]) * 60 * 60) + (float(ting.replace(",", ".").replace(" ", "").split(":")[1]) * 60) + float(ting.replace(",", ".").replace(" ", "").split(":")[2]))
			else:
				text += ("%s\n" % i)
		else:
			if contenting != []:
				contenting.append(text)
				parsed.append(contenting)
			contenting = []
			text = ""

	return parsed
	
	# regex who? 💀💀💀

func parse_minus_last_timestamp(path):
	var sub = parse(path)
	var parsed = []
	var lasttime = 0
	
	for i in sub:
		var count = 1
		var temp = []
		
		if i == []:
			continue
		temp.append(i[0])
		temp.append(i[1] - lasttime)
		lasttime = i[1]
		for ei in i:
			if count > 3:
				temp.append(ei)
			count += 1
		parsed.append(temp)
		
	return parsed
