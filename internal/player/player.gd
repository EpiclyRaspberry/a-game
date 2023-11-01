extends CharacterBody3D

const SPEED = 5
const JUMP_VELOCITY = 4.5

var ACCERATION = 0
var DECCELERATION = 0.00001
var direction
var input_dir

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var neck := $Neck
@onready var camera := $Neck/Camera3D

var isgrounded: bool = false
var can_abh: bool = false
const HALFPI = PI/2
var crouching = false

var is_zoomed = false
var camerasensnerf = 1

##camera stuffs
#var zcamtimer = Timer.new()
#const ZTILTSMOOTHNESS = 20
#var ztiltlist1 = []

var cameratilt_speed = 10

func _ready():
	pass
#	const HALFPI = PI/2
#	for i in range(ZTILTSMOOTHNESS):
#		#change the inside to change the interpolation you want
#		ztiltlist1.append(sin(HALFPI/ZTILTSMOOTHNESS)*i)
#		#print(sin(HALFPI/ZTILTSMOOTHNESS)*i)
#	zcamtimer.connect("timeout",zcameratilt)
#	zcamtimer.wait_time = 0.05
#	zcamtimer.one_shot = false
#	add_child(zcamtimer)
#	zcamtimer.start()
	
func rotate_vec(vec: Vector2, angle_deg: int) -> Vector2:
	var rad = deg_to_rad(angle_deg)
	var nx = vec.x * cos(rad) - vec.y * sin(rad)
	var ny = vec.x * sin(rad) + vec.y * cos(rad)
	return Vector2(nx,ny)
	pass

func _unhandled_input(event: InputEvent) -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * 0.01 * camerasensnerf)
			camera.rotate_x(-event.relative.y * 0.01 * camerasensnerf) 
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(90))
	
			
func _physics_process(delta: float) -> void:
	
	#controller support
	var controller_input_dir = Input.get_vector("look-left", "look-right", "look-up", "look-down")
	neck.rotate_y(-controller_input_dir.x * 0.1 * camerasensnerf)
	camera.rotate_x(-controller_input_dir.y * 0.1 * camerasensnerf) 
	camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(90))
	#end
	
	if Input.is_action_just_pressed("scroll-in"):
		camerasensnerf = 0.01
		is_zoomed = true
	if Input.is_action_just_pressed("scroll-out"):
		camerasensnerf = 1
		is_zoomed = false
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("crouch"):
		if crouching:
			$CollisionShape3D.scale.y = 1
			crouching  = false
		else:
			$CollisionShape3D.scale.y =  0.5
			crouching = true

	input_dir = Input.get_vector("left", "right", "forward", "back")
	direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	neck.rotation.z = lerp(neck.rotation.z, deg_to_rad(clamp(input_dir.x * 1.5, -5, 5)), delta * cameratilt_speed)
#
#	print(neck.rotation.z) # quake camera 
#	neck.rotation.z = (rotation.z + (input_dir.x / 10))
	
	#smoother attemp using sine wave

	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
		if velocity.z > 0 and Input.is_action_pressed("crouch"):
			ACCERATION = ACCERATION*1.3
	
	if direction: 
		if ACCERATION < 1.05:
			ACCERATION += 0.05
		velocity.x = direction.x * SPEED * ACCERATION
		velocity.z = direction.z * SPEED * ACCERATION
	else:
		if can_abh:
			velocity.x = velocity.x*-1.05
			velocity.z = velocity.z*-1.05
		else: if is_on_floor():
			velocity.x = velocity.x/1.05
			velocity.z = velocity.z/1.05
		
		if ACCERATION > 0 and not is_on_floor():
			ACCERATION -= 0.05
		elif ACCERATION > 0 and is_on_floor():
			ACCERATION -= .4
		elif ACCERATION < 0:
			ACCERATION = 0
				
#		var vec = rotate_vec(Vector2(ACCERATION,0),neck.rotation_degrees.y)
#		print(vec)
#		velocity = velocity - Vector3(-vec.x,0,-vec.y)
#		print(velocity)
#		if ACCERATION > 0:
#			ACCERATION -= 0.075

#	$Neck/Camera3D.fov = int(lerp(75.0, $Neck/Camera3D.fov * ACCERATION * 2, delta * 3))
	
	
	if is_zoomed:
		$Neck/Camera3D.fov = int(lerp($Neck/Camera3D.fov, 20.0, delta * 5))
	else:
		$Neck/Camera3D.fov = int(lerp($Neck/Camera3D.fov, 75.0, delta * 5))

	move_and_slide()
	
	if is_on_floor() and Input.is_action_pressed("ui_accept") and Input.is_action_pressed("crouch") and not Input.is_action_pressed("back"):
		can_abh = true
	else:
		can_abh = false
#func zcameratilt():
#	if input_dir.x:
#		if zci < ZTILTSMOOTHNESS-1:
#			zci += 1
#	else:
#		#fix this pls if you can
#		neck.rotation.z = (ztiltlist1[zci]*input_dir.x)/ZTILTSMOOTHNESS
#		if zci > 0:
#			zci -= 1
#			print(zci)
#		
#		#elif zci < 0: zci += 1
#	neck.rotation.z = (ztiltlist1[zci]*input_dir.x)/ZTILTSMOOTHNESS
	
