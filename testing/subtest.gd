extends VideoStreamPlayer

var counter = 0
var played = false
var sub = Library.get_node("srt_parser").parse_minus_last_timestamp("res://assets/subtitles/test/badapple.srt")

func _ready():
	#play()
	pass

func _process(delta):
	if not played:
		if is_playing():
			$Timer.start()
			played = true
			

func _on_timer_timeout():
	if counter < len(sub):
		if counter > 0:
			$Label.text = sub[counter - 1][2]
			$Timer.wait_time = sub[counter][1]
		else:
			$Timer.wait_time = sub[counter][1]
		counter += 1
		$Timer.start()
	else:
		$Label.text = sub[counter - 1][2]
	pass
