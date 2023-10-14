extends Control

var maps: Array
@onready var maplist = $MapList
@onready var mapname = $MapName
@onready var mapdesc = $MapDesc
@onready var playbtn = $PlayButton
var mapindex: int
# Called when the node enters the scene tree for the first time.
func _ready():
	maps = JSON.parse_string(FileAccess.open("res://maps/maps.json",FileAccess.READ).get_as_text())
	for map in maps:
		var thumbnail
		if not FileAccess.file_exists("res://maps/%s/thumbnail.jpg" % map["path"]) or not FileAccess.file_exists("res://maps/%s/thumbnail.png" % map["path"]):
			thumbnail = load("res://assets/320x240.png")
		else: thumbnail = load("res://maps/%s/thumbnail.jpg" % map["path"])
		maplist.add_item("%s" % map["name"],thumbnail)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not "PauseMenu" in Gv.names(str(get_tree().get_current_scene().get_path())):
		if Input.is_action_just_pressed("ui_cancel"):
			visible = false


func _on_map_list_item_clicked(index, at_position, mouse_button_index):
	playbtn.disabled = false
	if mouse_button_index == 1:
		mapname.text = maps[index]["name"]
		mapdesc.text = maps[index]["description"]
		mapindex = index


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://maps/%s/%s.tscn" % [maps[mapindex]['path'], maps[mapindex]['path']])
