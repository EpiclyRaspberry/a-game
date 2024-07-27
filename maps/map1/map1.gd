extends Node3D

@onready var camblue = $portalblue/display/camb
@onready var bdisp = $portalblue/display

@onready var camorag = $portalorag/display/camo
@onready var odisp = $portalorag/display

@onready var player = $playerbase
@onready var cam = $playerbase/Neck/Camera3D
@onready var raycast = $playerbase/Neck/Camera3D/RayCast3D
# Called when the node enters the scene tree for the first time.
var displaycenter = Vector2()

func get_disp_center():
	displaycenter = get_viewport().get_window().size/2

func _ready():
	pass # Replace with function body.

func distance(v1: Vector3, v2: Vector3):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_disp_center()
	var pbtex = camblue.get_viewport().get_texture()
	var potex = camorag.get_viewport().get_texture()
	
	odisp.mesh.material.albedo_texture = pbtex
	bdisp.mesh.material.albedo_texture = potex
	
	if Input.is_action_just_pressed("mouseleft"):
		print("left")
		odisp.position = raycast.get_collision_point()-Vector3(.00001,.00001,.00001)
	if Input.is_action_just_pressed("mouseright"):
		print("right")
		bdisp.position = raycast.get_collision_point()-Vector3(.00001,.00001,.00001)
	
