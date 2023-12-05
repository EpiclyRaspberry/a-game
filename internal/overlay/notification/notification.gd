extends Control

var currentnoti = []

func send(title, content, colormode):
	var dup = get_node("base").duplicate()
	add_child(dup)
	dup.get_node("title").text = title
	dup.get_node("content").text = content
	dup.pivot_offset.x = dup.size.x / 2
	dup.pivot_offset.y = dup.size.y / 2
	
	if colormode == "chroma":
		dup.chroma = true
	elif colormode == "normal":
		pass

	if len(currentnoti) < 1:
		pass
	else:
		dup.position.y = (currentnoti[-1][0] + dup.size.y)
	dup.visible = true
	currentnoti.append([dup.position.y, Time.get_unix_time_from_system(), dup.get_instance_id()])

func _process(_delta):
	
	for i in currentnoti:	
	#	tween.tween_property($CanvasLayer, "scale", Vector2(1, 1), 0.2).set_trans(Tween.TRANS_CUBIC)
		
		if (Time.get_unix_time_from_system() - i[1]) > 2:
			currentnoti.erase(i)
			if not instance_from_id(i[2]) == null:
				
				instance_from_id(i[2]).pivot_offset.x = instance_from_id(i[2]).size.x / 2
				instance_from_id(i[2]).pivot_offset.y = 0
				
				var tween = get_tree().create_tween()
				
				tween.tween_property(instance_from_id(i[2]), "scale", Vector2(1, 0.001), 0.1).set_trans(Tween.TRANS_CUBIC)
				tween.tween_callback(instance_from_id(i[2]).queue_free)
					
					
		if i[0] + $base.size.y > get_viewport().size.y:
			var temp = currentnoti[0]
			currentnoti.erase(currentnoti[0])
			if not instance_from_id(temp[2]) == null:
				
				instance_from_id(i[2]).pivot_offset.x = instance_from_id(i[2]).size.x / 2
				instance_from_id(i[2]).pivot_offset.y = 0
				
				var tween = get_tree().create_tween()
				
				tween.tween_property(instance_from_id(temp[2]), "scale", Vector2(1, 0.001), 0.1).set_trans(Tween.TRANS_CUBIC)
				tween.tween_callback(instance_from_id(temp[2]).queue_free)
				
				
	if not len(currentnoti) < 1:
		if currentnoti[0][0] == $base.size.y:
			for i in currentnoti:
				var tween = get_tree().create_tween()
				
				i[0] -= $base.size.y
				tween.tween_property(instance_from_id(i[2]), "position", Vector2(instance_from_id(i[2]).position.x, i[0]), 0.2).set_trans(Tween.TRANS_CUBIC)

