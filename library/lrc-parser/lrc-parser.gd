extends Node

func parse(path):
	var parsed = []
	var file = FileAccess.open(path, FileAccess.READ)
	var content = file.get_as_text().replace("[", "").split("\n")
	for i in content:
		parsed.append(i.split("]"))
	return parsed
	
	# returns an array

	
func parse_only_timestamp_and_lyric(path):
	var parsed = []
	for i in parse(path):
		if i[0].replace(":", "").replace(".", "").is_valid_float():
			parsed.append(i)
	return parsed

	# same thing as parse function but removes all the unnessesary bloat from original lyric

func parse_only_timestamp_and_lyric_minus_last_timestamp(path):
	var counter = 0
	var lasttime = 0
	var parsed = []
	var lyric = parse_only_timestamp_and_lyric(path)
	
	for i in lyric:
		parsed.append([float(i[0].split(":")[0]) * 60 + float(i[0].split(":")[1]) - lasttime, lyric[counter][1] ])
		lasttime = (float(i[0].split(":")[0]) * 60 + float(i[0].split(":")[1]))
		counter += 1

	return parsed
	
	# easier to code something like live lyric with
