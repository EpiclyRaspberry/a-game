extends Node

func parse(path):
	var parsed = []
	var file = FileAccess.open(path, FileAccess.READ)
	var content = file.get_as_text().replace("[", "").split("\n")
	for i in content:
		parsed.append(i.split("]"))
	return parsed
	
	# returns an array

	
func parse_get_only_timestamp_and_lyric(path):
	var parsed = []
	for i in parse(path):
		if i[0].replace(":", "").replace(".", "").is_valid_float():
			parsed.append(i)
	return parsed

	# same thing as parse function but removes all the unnessesary bloat from original lyric
