extends Label

var timetodo = []
var counter = 0
var lyrics = Library.get_node("lrc_parser").parse_get_only_timestamp_and_lyric("res://assets/music/lyrics/heather-by-glaive-ericdoa.lrc")
var lasttime = 0

func _ready():
	for i in lyrics:
		timetodo.append(float(i[0].split(":")[0]) * 60 + float(i[0].split(":")[1]) - lasttime)
		lasttime = (float(i[0].split(":")[0]) * 60 + float(i[0].split(":")[1]))
	$AudioStreamPlayer2D.play()

func _on_timer_timeout():
	if counter > 0:
		text = lyrics[counter - 1][1]
		$Timer.wait_time = timetodo[counter]
		$Timer.start()
	else:
		$Timer.wait_time = timetodo[counter]
		$Timer.start()
	counter += 1
