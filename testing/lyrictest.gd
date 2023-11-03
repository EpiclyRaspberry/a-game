extends Label

var counter = 0
var lyrics = Library.get_node("lrc_parser").parse_only_timestamp_and_lyric_minus_last_timestamp("res://assets/music/lyrics/heather-by-glaive-ericdoa.lrc")

func _ready():
	pass
	#$Timer.start()
	#$AudioStreamPlayer2D.play()

func _on_timer_timeout():
	if counter < len(lyrics):
		if counter > 0:
			Notification.send("Lyric", lyrics[counter - 1][1], "normal")
			text = lyrics[counter - 1][1]
			$Timer.wait_time = lyrics[counter][0]
		else:
			$Timer.wait_time = lyrics[counter][0]
		$Timer.start()
		counter += 1
	else:
		Notification.send("Lyric", lyrics[counter - 1][1], "normal")
		text = lyrics[counter - 1][1]
	
