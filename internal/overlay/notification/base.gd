extends ColorRect

var chroma = false

var hue_timer = 0
var speed = 100 #degrees per second

func _physics_process(delta):
	if chroma == true:
		hue_timer = fmod(hue_timer + delta * speed, 360)
		var h = hue_timer / 360 #h,s,v needs to be in range 0-1
	
		#New color, the order MUST be set in V,S,H, this is because Color
		#only saves RGB values, it does not save HSV values.
		var new_color = Color()
		new_color.v = 1 #value
		new_color.s = 1 #saturation
		new_color.h = h #hue
		new_color.a = 0.4
		
		color = new_color
