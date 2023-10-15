extends ColorRect

func _process(delta):
	if $AnimationPlayer.is_playing() == false:
		get_parent().get_parent().queue_free()
