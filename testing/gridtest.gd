extends Control

var srs
var srp
var gridsize


func _draw():
	for i in range(0, srs.y, 70):
		draw_line(Vector2(srp.x, i), Vector2(srs.x, i), Color(255, 0, 0), 1)
	for i in range(0, srs.x, 70):
		draw_line(Vector2(i, srp.y), Vector2(i, srs.y), Color(255, 0, 0), 1)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	srs = size
	srp = position
#	for i in range(0, 1000, size.x):
#		get_viewport().get_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	srs = size
	srp = position
	queue_redraw()

